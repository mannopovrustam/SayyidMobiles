<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Spatie\Permission\Models\Permission;

class PermissionController extends Controller
{
    public function index()
    {
        $permissions = Permission::all();
        return view('users.permission', compact('permissions'));
    }

    public function store(Request $request)
    {
        $values = Arr::except($request->all(), ['data_id']);
        Permission::updateOrCreate(['id' => $request->data_id], $values);
        return back();
    }
}
