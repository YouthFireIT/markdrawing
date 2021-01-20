<?php

namespace App\Http\Controllers\Backend;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\City;

class CityController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    
    public function create()
    {
    	return view('backend.pages.city.create');
    }
    public function store(Request $request)
    {

    	$request->validate([
    		'name' => 'required|max:150',    		
    	]);
    	
    	$city = new City;

    	$city->name = $request->name;
    	$city->save();

    	session()->flash('success','New Country has been added successfully.');
    	return redirect()->route('admin.city.create');


    	
    }

    public function manage()
    {
    	$cities = City::orderBy('priority', 'asc')->get();

    	return view('backend.pages.city.index',compact('cities'));
    }

    public function edit($id)
    {
    	$city = City::find($id);
    	return view('backend.pages.city.edit', compact('city'));	
    }

    public function update(Request $request, $id)
    {
    	$request->validate([
    		'name' => 'required|max:150'    		
    	]);

    	$city = City::find($id);

    	$city->name = $request->name;
    	$city->save();

    	session()->flash('success','New Country has been updated successfully.');
    	return redirect()->route('admin.cities');


    	
    }

    public function delete($id)
    {
    	$city = City::find($id);

    	if (!is_null($city)) {
    		$city->delete();
    	}

    	session()->flash('success', 'Country has been deleted successfully!!');
    	return back();
    }
}
