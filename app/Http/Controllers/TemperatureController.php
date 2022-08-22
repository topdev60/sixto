<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;

use App\Models\Temperature;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class TemperatureController extends Controller
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
        //
        $temp = Temperature::insert([
            'ProjectID' => Session::get('projectId'),
            'TVD' => $request->tvd,
            'TG' => $request->tg,
            'Temperature' => $request->temperature,
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
     * @param  \App\Models\Temperature  $temperature
     * @return \Illuminate\Http\Response
     */
    public function show(Temperature $temperature)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Temperature  $temperature
     * @return \Illuminate\Http\Response
     */
    public function edit(Temperature $temperature)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Temperature  $temperature
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Temperature $temperature)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Temperature  $temperature
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        //
        $id = $request->id;
        Temperature::where('TempID', $id)->delete();
        return redirect()->back();
    }

    public function destroyAllRows($id)
    {
        Temperature::where('ProjectID', $id)->delete();
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
            Temperature::insert([
                'ProjectID' => $projectId,
                'TVD' => $row[0],
                'TG' => $row[1],
                'Temperature' => $row[2],
            ]);
        }

        return 1;
    }
}
