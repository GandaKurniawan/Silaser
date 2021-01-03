<?php

namespace App\Http\Controllers;

// use App\Profile_model;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class UsersController extends Controller
{
    public function index()
    {
        return view('users.login_register');
    }
    public function register(Request $request)
    {
        $this->validate(
            $request,

            [
                'name' => 'required|string|max:255|unique:users,name',
                'email' => 'required|string|email|unique:users,email',
                'password' => 'required|min:6|confirmed',
            ],
            [
                'name.required' => 'Field is Required',
                'email.required' => 'Field is Required',
                'password.required' => 'Field is Required',
                'name.unique' => 'Account  is Not Valid',
                'email.unique' => 'Account  is Not Valid',
                'password.confirmed' => 'Account  is Not Valid',
            ]

        );
        $input_data = $request->all();
        $input_data['password'] = Hash::make($input_data['password']);
        User::create($input_data);
        return back()->with('message', 'Registered already!');
    }
    public function login(Request $request)
    {
        $input_data = $request->all();
        if (Auth::attempt(['email' => $input_data['email'], 'password' => $input_data['password']])) {
            Session::put('frontSession', $input_data['email']);
            $status = User::select('status')->where('id', Auth::id())->first();
            $status = $status['status'];

            if ($status == 1) {
                return redirect('/admin');
            } else if ($status == 2) {
                return redirect('/konsultan');
            } else {
                return redirect('/');
            }
        } else {
            return back()->with('message', 'Account is not Valid!');
        }
    }
    public function logout()
    {
        Auth::logout();
        Session::forget('frontSession');
        return redirect('/login');
    }
    public function account()
    {
        $user_login = User::where('id', Auth::id())->first();
        return view('users.account', compact('user_login'));
    }
    public function updateprofile(Request $request, $id)
    {
        $this->validate($request, [
            'address' => 'required|min:10|max:65535',
            'kelurahan' => 'required|min:5|max:30',
            'kecamatan' => 'required|min:5|max:30',
            'postcode' => 'required|numeric|digits:5',
            'mobile' => 'required|min:12|max:15',
        ]);
        $input_data = $request->all();
        DB::table('users')->where('id', $id)->update([
            'address' => $input_data['address'],
            'kelurahan' => $input_data['kelurahan'],
            'kecamatan' => $input_data['kecamatan'],
            'postcode' => $input_data['postcode'],
            'mobile' => $input_data['mobile']
        ]);
        return back()->with('message', 'Well Done! profil anda berhasil diubah');
    }
    public function updatepassword(Request $request, $id)
    {
        $oldPassword = User::where('id', $id)->first();
        $input_data = $request->all();
        if (Hash::check($input_data['password'], $oldPassword->password)) {
            $this->validate($request, [
                'newPassword' => 'required|min:6|confirmed',
            ]);
            $new_pass = Hash::make($input_data['newPassword']);
            User::where('id', $id)->update(['password' => $new_pass]);
            return back()->with('message', 'Update Password Already!');
        } else {
            return back()->with('oldpassword', 'Old Password is Inconrrect!');
        }
    }
}
