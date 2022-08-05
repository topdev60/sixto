<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;

use App\Models\Surfpiping;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class SurfpipingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $projectid = Session::get('projectId');
        $id = $request->id;
        $length = $request->length;
        $surf = Surfpiping::insert([
            'ProjectID' => $projectid,
            'ID' => $id,
            'Length' => $length,
        ]);

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Surfpiping  $surfpiping
     * @return \Illuminate\Http\Response
     */
    public function show(Surfpiping $surfpiping)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Surfpiping  $surfpiping
     * @return \Illuminate\Http\Response
     */
    public function edit(Surfpiping $surfpiping)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Surfpiping  $surfpiping
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $projectid = Session::get('projectId');
        $id = $request->id;
        $length = $request->length;
        $surf = Surfpiping::where('SurfID', $request->surfId)->update([
            'ProjectID' => $projectid,
            'ID' => $id,
            'Length' => $length,
        ]);

        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Surfpiping  $surfpiping
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        Surfpiping::where('SurfID', $request->surfid)->delete();
        return redirect()->back();
    }
}
