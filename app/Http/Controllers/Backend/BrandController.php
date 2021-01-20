<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Brand;

class BrandController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    
    public function create()
    {
    	return view('backend.pages.brand.create');
    }
    public function store(Request $request)
    {

    	$request->validate([
    		'name' => 'required|max:150',
    		
    	]);
    	
    	$brand = new Brand;

    	$brand->name = $request->name;
      $brand->amount = $request->amount;
    	$brand->save();


    	session()->flash('success', 'Print has been added successfully!!');
    	return redirect()->route('admin.brand.create');


    	
    }

    public function manage()
    {

    	$brands = Brand::orderBy('name','asc')->get();
    	return view('backend.pages.brand.index', compact('brands'));
    }

    public function edit($id)
    {
    	$brand = Brand::find($id);
    	return view('backend.pages.brand.edit', compact('brand'));
    }

    public function update(Request $request, $id)
    {

    	$request->validate([
    		'name' => 'required|max:150',
    		
    	]);
    	
    	$brand = Brand::find($id);

    	$brand->name = $request->name;
      $brand->amount = $request->amount;

    	$brand->save();
    	session()->flash('success', 'Print updated successfully!!');
    	return redirect()->route('admin.brands');    	
		}
		
    public function delete($id)
    {
    	$brand = Brand::find($id);
    	if (!is_null($brand)) {
    		$brand->delete();
    	}

    	session()->flash('success', 'Category has been deleted successfully!!');
    	return back();
    }
}
