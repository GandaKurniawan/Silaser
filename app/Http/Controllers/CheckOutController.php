<?php

namespace App\Http\Controllers;

use App\Cart_model;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CheckOutController extends Controller
{
    public function index()
    {
        $cart_data = Cart_model::where('users_id', Auth::id())->count();
        if ($cart_data == 0) {
            return redirect(url('/viewcart'))->with('message', 'Keranjang anda kosong.');
        } else {
            $user_login = User::where('id', Auth::id())->first();
            return view('checkout.index', compact('user_login'));
        }
    }
    public function submitcheckout(Request $request)
    {
        $this->validate($request, [
            'billing_name' => 'required',
            'billing_address' => 'required|min:10|max:255',
            'billing_kelurahan' => 'required|min:5|max:30',
            'billing_kecamatan' => 'required|min:5|max:30',
            'billing_postcode' => 'required|numeric|digits:5',
            'billing_mobile' => 'required|min:12|max:15',
        ]);
        $input_data = $request->all();
        $check_users = DB::table('users')->select('address')->where('id', Auth::id());
        if ($check_users != NULL) {
            DB::table('users')->where('id', Auth::id())->update([
                'address' => $input_data['billing_address'],
                'kelurahan' => $input_data['billing_kelurahan'],
                'kecamatan' => $input_data['billing_kecamatan'],
                'postcode' => $input_data['billing_postcode'],
                'mobile' => $input_data['billing_mobile']
            ]);
        } else {
            DB::table('users')->insert([
                'address' => $input_data['billing_address'],
                'kelurahan' => $input_data['billing_kelurahan'],
                'kecamatan' => $input_data['billing_kecamatan'],
                'postcode' => $input_data['billing_postcode'],
                'mobile' => $input_data['billing_mobile']
            ]);
        }
        return redirect('/order-review');
    }
}
