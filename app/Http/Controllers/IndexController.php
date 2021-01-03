<?php

namespace App\Http\Controllers;

use App\Category_model;
use App\ImageGallery_model;
use App\Products_model;
use Illuminate\Contracts\Session\Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IndexController extends Controller
{
    public function index()
    {
        // dd(Auth::user()->status);
        $products = Products_model::all();
        return view('pelanggan.index', compact('products'));
    }
    // public function shop()
    // {
    //     $products = Products_model::all();
    //     $byCate = "";
    //     return view('pelanggan.products', compact('products', 'byCate'));
    // }
    public function listByCat($id)
    {
        $list_products = Products_model::join('categories', 'categories.id', '=', 'products.categories_id')->where('categories.id', $id)->get();
        // $byCate = Category_model::select('name')->where('id', $id)->first();
        // dd($list_products);
        return view('pelanggan.products', compact('list_products'));
    }
    public function detailpro($id)
    {
        $detail_product = Products_model::findOrFail($id);
        $imagesGalleries = ImageGallery_model::where('products_id', $id)->get();
        // $totalStock = ProductAtrr_model::where('id_produk', $id)->sum('stock');
        $relateProducts = Products_model::where([['id', '!=', $id], ['categories_id', $detail_product->categories_id]])->get();
        return view('pelanggan.product_details', compact('detail_product', 'imagesGalleries', 'relateProducts'));
    }
    public function payment()
    {
        return view('payment.payment');
    }
}
