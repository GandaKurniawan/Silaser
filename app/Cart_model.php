<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cart_model extends Model
{
    protected $table = 'cart';
    protected $primaryKey = 'id';
    protected $fillable = ['users_id', 'products_id', 'quantity', 'session_id'];

    public function product()
    {
        return $this->belongsTo(Products_model::class, 'products_id', 'id');
    }
}
