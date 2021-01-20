<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use App\Attribute;
use App\AttributeSet;

class AttributeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }
    
    public function create()
    {
    	return view('backend.pages.attribute.create');
    }
    public function store(Request $request)
    {

    	$request->validate([
    		'name' => 'required|max:150',
    		'amount' => 'required',
    		
    	]);
    	
    	$attribute = new Attribute;

        $attribute->name = $request->name;
        $attribute->amount = $request->amount;

    	$attribute->save();


    	return redirect()->route('admin.attribute.create');


    	
    }

    public function manage()
    {

    	$attributes = Attribute::orderBy('name','asc')->get();
    	return view('backend.pages.attribute.index', compact('attributes'));
    }

    public function edit($id)
    {
    	$attribute = Attribute::find($id);
    	return view('backend.pages.attribute.edit', compact('attribute'));
    }

    public function update(Request $request, $id)
    {

    	
    	$request->validate([
    		'name' => 'required|max:150',
    		'amount' => 'required',
    		
    	]);
    	
    	$attribute = Attribute::find($id);

        $attribute->name = $request->name;
        $attribute->amount = $request->amount;

    	$attribute->save();


    	return redirect()->route('admin.attributes');
    	
    }

    public function delete($id)
    {
    	$attribute = Attribute::find($id);
    	$attribute->delete();

    	session()->flash('success', 'Attribute has been deleted successfully!!');
    	return back();
    }
}
