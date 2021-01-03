<?php

namespace App\Http\Controllers;

use App\Expedition_model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class ExpeditionController extends Controller
{
    public function applyexpedition(Request $request)
    {
        $this->validate($request, [
            'expedition' => 'required'
        ]);


        $input_data = $request->all();
        Session::forget('discount_amount_price');
        Session::forget('coupon_code');
        $auth_id = Auth::id();

        $expedition = $input_data['expedition'];
        $expedition_charge = Expedition_model::select('base_charge')->where('id', $expedition)->get();

        $products = DB::select("SELECT sum(cart.quantity*products.weight) as quantityweight FROM `cart`,`products` WHERE cart.products_id = products.id and cart.users_id = $auth_id");
        foreach ($expedition_charge as $charge) {
            $base_charge = $charge->base_charge;
            foreach ($products as $product) {
                $sum_prod = $product->quantityweight;
            }
            if ($sum_prod <= 1500) {
                $expedition_total = $base_charge;
            } else {
                $cons = 2500;
                while ($sum_prod >= $cons) {
                    $cons = $cons + 1000;
                }
                $int = floor($cons / 1000);
                $expedition_total = $base_charge * $int;
            }
        }
        Session::put('expedition', $expedition);
        Session::put('expedition_total', $expedition_total);
        return back()->with('message_apply_sucess', 'Berhasil memilih ekspedisi');
    }
}
