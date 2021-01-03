<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Message_model extends Model
{
    protected $table = "messages";
    protected $fillable = ['from', 'to', 'message', 'is_read'];
}
