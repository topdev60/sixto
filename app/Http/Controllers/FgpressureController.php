<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;

use App\Models\Fgpressure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class FgpressureController extends Controller
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
        $temp = Fgpressure::insert([
            'ProjectID' => Session::get('projectId'),
            'TVD' => $request->tvd,
            'FG' => $request->fg,
            'Pressure' => $request->pressure,
        ]);
        if ($temp) {
            return redirect()->back();
        }else {
            return 'Error';
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Fgpressure  $fgpressure
     * @return \Illuminate\Http\Response
     */
    public function show(Fgpressure $fgpressure)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Fgpressure  $fgpressure
     * @return \Illuminate\Http\Response
     */
    public function edit(Fgpressure $fgpressure)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Fgpressure  $fgpressure
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Fgpressure $fgpressure)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Fgpressure  $fgpressure
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $id = $request->id;
        Fgpressure::where('FG_ID', $id)->delete();
        return redirect()->back();
    }

    public function destroyAllRows($id)
    {
        Fgpressure::where('ProjectID', $id)->delete();
        return redirect()->back();
    }
}
