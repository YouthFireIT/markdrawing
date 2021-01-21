<?php
use App\Admin;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;


class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin = Admin::where(['id'=>2])->first();
        if(is_null($admin)){
            $admin = new Admin();
            $admin->name = "Admin";
            $admin->email = "admin@gmail.com";
            $admin->phone_no = "01914468204";
            $admin->type = "Super Admin";
            $admin->password = Hash::make('password');
            $admin->save();
        }
    }
}
