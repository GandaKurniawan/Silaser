<?php

namespace App\Http\Controllers;

use App\Cart_model;
use App\Expedition_model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class CartController extends Controller
{

    public function index()
    {
        $session_id = Session::get('session_id');
        $auth_id = Auth::id();
        $cart_datas = DB::select("SELECT cart.id, cart.users_id,products.description, cart.quantity, products.p_name, products.price, cart.quantity, products.image, products.stock FROM `cart`,`products`, `users` WHERE users.id = $auth_id and cart.products_id = products.id and cart.users_id = users.id");
        $expedition_datas = Expedition_model::all();

        if ($cart_datas == NULL) {
            Session::forget('expedition_total');
            $expedition = 0;
        } else {
            $expedition = 10000;
        }

        $total_price = 0;
        foreach ($cart_datas as $cart_data) {
            if ($cart_data->stock <= 0) {
                DB::table('cart')->where('id', $cart_data->id)->delete();
            }
            $total_price += ($cart_data->price * $cart_data->quantity);
        }
        return view('pelanggan.cart', compact('cart_datas', 'total_price', 'expedition', 'expedition_datas'));
    }

    public function addToCart(Request $request)
    {
        $inputToCart = $request->all();
        Session::forget('discount_amount_price');
        Session::forget('coupon_code');
        $auth_id = Auth::id();
        $stock = DB::table('products')->select('stock')->where(['id' => $inputToCart['products_id']]);
        if ($stock >= $inputToCart['quantity']) {
            $session_id = Session::get('session_id');
            if (empty($session_id)) {
                $session_id = str_random(40);
                Session::put('session_id', $session_id);
            }
            $inputToCart['session_id'] = $session_id;
            $inputToCart['users_id'] = $auth_id;
            $count_duplicateItems = Cart_model::where([
                'products_id' => $inputToCart['products_id']
            ])->where('users_id', $auth_id)->count();
            if ($count_duplicateItems > 0) {
                return back()->with('message', 'Produk sudah ada di dalam keranjang. Cek kembali keranjang anda.');
            } else {
                Cart_model::create($inputToCart);
                return back()->with('message', 'Produk ditambahkan ke dalam keranjang.');
            }
        } else {
            return back()->with('message', 'Maaf stok sedang kosong');
        }
    }

    //Delete item from cart
    public function deleteItem($id = null)
    {
        Session::forget('discount_amount_price');
        Session::forget('expedition_total');
        Session::forget('coupon_code');
        DB::table('cart')->where('id', $id)->delete();
        return back()->with('message', 'Produk berhasil dihapus.');
    }

    //Update Cart
    public function updateQuantity($id, $quantity)
    {
        Session::forget('discount_amount_price');
        Session::forget('coupon_code');
        $auth_id = Auth::id();
        $cart_datas = DB::select("SELECT cart.id, cart.users_id,products.description, cart.quantity, products.p_name, products.price, cart.quantity, products.image, products.stock FROM `cart`,`products`, `users` WHERE users.id = $auth_id and cart.products_id = products.id and cart.users_id = users.id");


        foreach ($cart_datas as $cart_data) {
            $updated_quantity = $cart_data->quantity + $quantity;
            if ($cart_data->stock >= $updated_quantity) {
                DB::table('cart')->where('id', $id)->increment('quantity', $quantity);
                return back()->with('message', 'Update Quantity already');
            } else {
                return back()->with('message', 'Stock is not Available!');
            }

            if ($cart_data->stock < $updated_quantity) {
                return back();
            }
        }
    }
}
