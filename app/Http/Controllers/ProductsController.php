<?php

namespace App\Http\Controllers;

use App\Category_model;
use App\Products_model;
use Illuminate\Support\Facades\Storage;
use Image;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $menu_active = 3;
        $products = Products_model::all()->sortBy('id');
        return view('admin.products.index', compact('menu_active', 'products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $menu_active = 3;
        $categories = Category_model::all();
        return view('admin.products.create', compact('menu_active', 'categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate(
            $request,
            [
                'p_name' => 'required|max:50',
                'description' => 'required|max:65535',
                'stock' => 'required|numeric|min:0',
                'weight' => 'required|numeric',
                'price' => 'required|numeric',
                'image' => 'required|image|mimes:png,jpg,jpeg|max:1000',
            ],
            [
                'stock.numeric' => 'Field is not valid',
                'weight.numeric' => 'Field is not valid',
                'price.numeric' => 'Field is not valid',
            ]
        );
        $formInput = $request->all();
        if ($request->file('image')) {
            $image = $request->file('image');
            if ($image->isValid()) {
                $fileName = str_slug($formInput['p_name'], "-") . '.' . $image->getClientOriginalExtension();
                $large_image_path = public_path('products/large/' . $fileName);
                $medium_image_path = public_path('products/medium/' . $fileName);
                $small_image_path = public_path('products/small/' . $fileName);
                //Resize Image
                Image::make($image)->save($large_image_path);
                Image::make($image)->resize(600, 600)->save($medium_image_path);
                Image::make($image)->resize(300, 300)->save($small_image_path);
                $formInput['image'] = $fileName;
            }
        }
        Products_model::create($formInput);
        return redirect()->route('product.index')->with('message', 'Data Produk berhasil ditambahkan.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $menu_active = 3;
        $categories = Category_model::all();
        $edit_product = Products_model::findOrFail($id);
        $edit_category = Category_model::findOrFail($edit_product->categories_id);
        return view('admin.products.edit', compact('edit_product', 'menu_active', 'categories', 'edit_category'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $update_product = Products_model::findOrFail($id);
        $this->validate(
            $request,
            [
                'p_name' => 'required|max:50',
                'description' => 'required|min:10|max:65535',
                'stock' => 'required|numeric|min:0',
                'weight' => 'required|min:1|numeric',
                'price' => 'required|numeric|min:100',
                'image' => 'image|mimes:jpeg,jpg|max:1000',
            ],
            [
                'stock.numeric' => 'Field is not valid',
                'weight.numeric' => 'Field is not valid',
                'price.numeric' => 'Field is not valid',
            ]
        );
        $formInput = $request->all();
        if ($update_product['image'] == '') {
            if ($request->file('image')) {
                $image = $request->file('image');
                if ($image->isValid()) {
                    $fileName = str_slug($formInput['p_name'], "-") . '.' . $image->getClientOriginalExtension();
                    $large_image_path = public_path('products/large/' . $fileName);
                    $medium_image_path = public_path('products/medium/' . $fileName);
                    $small_image_path = public_path('products/small/' . $fileName);
                    //Resize Image
                    Image::make($image)->save($large_image_path);
                    Image::make($image)->resize(600, 600)->save($medium_image_path);
                    Image::make($image)->resize(300, 300)->save($small_image_path);
                    $formInput['image'] = $fileName;
                }
            }
        } else {
            $formInput['image'] = $update_product['image'];
        }
        $update_product->update($formInput);
        return redirect()->route('product.index')->with('message', 'Data Produk berhasil diubah.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $delete = Products_model::findOrFail($id);
        $image_large = public_path() . '/products/large/' . $delete->image;
        $image_medium = public_path() . '/products/medium/' . $delete->image;
        $image_small = public_path() . '/products/small/' . $delete->image;
        if ($delete->delete()) {
            unlink($image_large);
            unlink($image_medium);
            unlink($image_small);
        }
        return redirect()->route('product.index')->with('message', 'Berhasil menghapus.');
    }
    public function deleteImage($id)
    {
        // Products_model::where(['id' => $id])->update(['image' => '']);
        $delete_image = Products_model::findOrFail($id);
        $image_large = public_path() . '/products/large/' . $delete_image->image;
        $image_medium = public_path() . '/products/medium/' . $delete_image->image;
        $image_small = public_path() . '/products/small/' . $delete_image->image;
        if ($delete_image) {
            $delete_image->image = '';
            $delete_image->save();

            //// delete image ///
            unlink($image_large);
            unlink($image_medium);
            unlink($image_small);
        }
        return back();
    }
}
