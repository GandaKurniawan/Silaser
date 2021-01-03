<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'status', 'address', 'kelurahan', 'kecamatan', 'postcode', 'mobile'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
    public function isAdmin()
    {
        return ($this->status == 1);
    }
    public function isKonsultan()
    {
        return ($this->status == 2);
    }
    public function isPelanggan()
    {
        return ($this->status == 3);
    }
}
