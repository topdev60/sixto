<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;

use App\Models\Popressure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class PorepressureController extends Controller
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
        $temp = Popressure::insert([
            'ProjectID' => Session::get('projectId'),
            'TVD' => $request->tvd,
            'PP' => $request->pp,
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
     * @param  \App\Models\Popressure  $popressure
     * @return \Illuminate\Http\Response
     */
    public function show(Popressure $popressure)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Popressure  $popressure
     * @return \Illuminate\Http\Response
     */
    public function edit(Popressure $popressure)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Popressure  $popressure
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Popressure $popressure)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Popressure  $popressure
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $id = $request->id;
        Popressure::where('PP_ID', $id)->delete();
        return redirect()->back();
    }

    public function destroyAllRows($id)
    {
        Popressure::where('ProjectID', $id)->delete();
        return redirect()->back();
    }

    public function storePasteData(Request $request)
    {
        $projectId = Session::get('projectId');
        $rows = $request->rows;
        $rows = json_decode($rows);
        $newRows = [];
        unset($rows[count($rows)-1]); //because last element has "" value
        foreach ($rows as $key => $row) {
            $row = str_replace("\r", "", $row);
            $row = explode("\t", $row);
            Popressure::insert([
                'ProjectID' => $projectId,
                'TVD' => $row[0],
                'PP' => $row[1],
                'Pressure' => $row[2],
            ]);
        }

        return 1;
    }
}
