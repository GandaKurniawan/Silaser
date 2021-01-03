<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Products_model extends Model
{
    protected $table = 'products';
    protected $primaryKey = 'id';
    protected $fillable = ['categories_id', 'p_name', 'description', 'stock', 'price', 'weight', 'image'];

    public function category()
    {
        return $this->belongsTo(Category_model::class, 'categories_id', 'id');
    }
    public function cart()
    {
        return $this->hasMany(Cart_model::class, 'products_id', 'id');
    }
}
