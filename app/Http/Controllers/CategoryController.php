<?php

namespace App\Http\Controllers;

use App\Category_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $menu_active = 2;
        $categories = Category_model::all()->sortBy('id');
        return view('admin.category.index', compact('menu_active', 'categories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $menu_active = 2;
        return view('admin.category.create', compact('menu_active'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function checkCateName(Request $request)
    {
        $data = $request->all();
        $category_name = $data['name'];
        $ch_cate_name_atDB = Category_model::all();
        if ($category_name == $ch_cate_name_atDB['name']) {
            echo "true";
            die();
        } else {
            echo "false";
            die();
        }
    }
    public function store(Request $request)
    {
        $this->validate(
            $request,
            [
                'name' => 'required|max:30|unique:categories,name'
            ],
            [
                'name.required' => "Please fill out this field",
                'name.unique' => "Field is not valid",
            ]
        );

        $data = $request->all();
        Category_model::create($data);
        return redirect()->route('category.index')->with('message', 'Daftar Kategori berhasil ditambahkan');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        echo $id;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $menu_active = 2;
        $categories = Category_model::findOrFail($id);
        return view('admin.category.edit', compact('categories', 'menu_active'));
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
        $update_categories = Category_model::findOrFail($id);
        $this->validate(
            $request,
            [
                'name' => 'required|max:30|unique:categories,name',
            ],
            [
                'name.unique' => 'Field is not valid',
            ]
        );
        $input_data = $request->all();

        $update_categories->update($input_data);
        return redirect()->route('category.index')->with('message', 'Daftar Kategori berhasil diubah');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $delete = Category_model::findOrFail($id);
        $delete->delete();
        return redirect()->route('category.index')->with('message', 'Berhasil menghapus Kategori');
    }
}
