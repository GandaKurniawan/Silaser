<?php

namespace App\Http\Controllers;

use Image;
use App\User;
use App\Orders_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class OrdersPelangganController extends Controller
{
    // orders/belum-dibayar -> Menampilkan semua yang belum dibayar
    public function belumdibayar()
    {
        $userid = Auth::id();
        $orders = DB::select(
            "SELECT orders.*, expeditions.expedition_name, expeditions.type, expeditions.estimation, users.name
            FROM orders 
            INNER join expeditions on expeditions.id = orders.expedition 
            INNER join users on users.id = orders.users_id 
            Where checkout_status = 'belum dibayar' and orders.users_id = $userid order BY orders.id DESC"
        );
        $orderdetails = DB::select(
            "SELECT order_details.orders_id, products.p_name, products.price, products.image, order_details.quantity
            FROM `orders`, `order_details`, `products`
            WHERE orders.id = order_details.orders_id and order_details.products_id = products.id and orders.users_id = $userid
            order BY orders.id DESC"
        );

        return view('orders.belum-dibayar', compact('orders', 'orderdetails'));
    }
    // orders/belum-dibayar -> Upload bukti oembayaran
    public function uploadpembayaran(Request $request, $id)
    {
        $update_order = Orders_model::findOrFail($id);
        $this->validate(
            $request,
            [
                'struk' => 'required|image|mimes:png,jpg,jpeg|max:5000',
            ],
            [
                'struk.max' => 'Ukuran maksimal 5MB'
            ]
        );
        $formInput = $request->all();
        if ($request->file('struk')) {
            $struk = $request->file('struk');
            if ($struk->isValid()) {
                $fileName = 'struk_order-' . $id . '.' . $struk->getClientOriginalExtension();
                $struk_path = public_path('checkout/' . $fileName);
                //Resize Image
                Image::make($struk)->resize(560, 420)->save($struk_path);
                $formInput['struk'] = $fileName;
            }
        }

        if ($update_order->struk == NULL) {
            // Mengirim Email notifikasi
            $admins = User::where('status', 1)->get();
            $data = array(
                'id' => $id
            );

            foreach ($admins as $admin) {
                Mail::send('emails.notifikasiPembayaran', $data, function ($notifikasiPembayaran) use ($admin, $id) {
                    $notifikasiPembayaran->to($admin->email, $admin->name)->subject("Pembayaran telah dilakukan untuk ID Order #" . $id);
                });
            }
        }

        $update_order->update($formInput);
        return back()->with('message', 'Well Done! bukti pembayaran berhasil ditambahkan');
    }

    // orders/sedang-proses -> Menampilkan semua yang sedang proses
    public function sedangproses()
    {
        $userid = Auth::id();
        $orders = DB::select(
            "SELECT orders.*, expeditions.expedition_name, expeditions.type, expeditions.estimation, users.name
            FROM orders 
            INNER join expeditions on expeditions.id = orders.expedition 
            INNER join users on users.id = orders.users_id 
            Where checkout_status = 'sudah dibayar' and receipt_status = 'belum diterima' and orders.users_id = $userid
            order BY orders.id DESC"
        );
        $orderdetails = DB::select(
            "SELECT order_details.orders_id, products.p_name, products.price, products.image, order_details.quantity
            FROM `orders`, `order_details`, `products`
            WHERE orders.id = order_details.orders_id and order_details.products_id = products.id and orders.users_id = $userid
            order BY orders.id DESC"
        );

        return view('orders.sedang-proses', compact('orders', 'orderdetails'));
    }

    public function konfirmasipenerimaan(Request $request, $id)
    {
        $update_order = Orders_model::findOrFail($id);
        $input_data = $request->all();

        $admins = User::where('status', 1)->get();
        $data = array(
            'id' => $id
        );

        foreach ($admins as $admin) {
            Mail::send('emails.notifikasiPenerimaan', $data, function ($notifikasiPenerimaan) use ($admin, $id) {
                $notifikasiPenerimaan->to($admin->email, $admin->name)->subject("Pemesanan dengan ID Order #" . $id . " telah diterima oleh Pelanggan");
            });
        }

        $update_order->update($input_data);
        return back()->with('message', 'Status penerimaan berhasil diubah');
    }
    public function sudahselesai()
    {
        $userid = Auth::id();
        $orders = DB::select(
            "SELECT orders.*, expeditions.expedition_name, expeditions.type, expeditions.estimation, users.name
            FROM orders 
            INNER join expeditions on expeditions.id = orders.expedition 
            INNER join users on users.id = orders.users_id 
            Where receipt_status = 'sudah diterima' and orders.users_id = $userid 
            order BY orders.id DESC"
        );
        $orderdetails = DB::select(
            "SELECT order_details.orders_id, products.p_name, products.price, products.image, order_details.quantity
            FROM `orders`, `order_details`, `products`
            WHERE orders.id = order_details.orders_id and order_details.products_id = products.id and orders.users_id = $userid
            order BY orders.id DESC"
        );

        return view('orders.sudah-selesai', compact('orders', 'orderdetails'));
    }
}
