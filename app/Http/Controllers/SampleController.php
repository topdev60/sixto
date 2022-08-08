<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\Fluids;
use App\Models\Sample;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class SampleController extends Controller
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
        Sample::insert([
            'FluidID'       => $request->FluidID,
            'Pressure'      => $request->pressure,
            'Temperature'   => $request->temperature,
            'R3'            => $request->r_3,
            'R6'            => $request->r_6,
            'R30'           => $request->r_30,
            'R60'           => $request->r_60,
            'R100'          => $request->r_100,
            'R200'          => $request->r_200,
            'R300'          => $request->r_300,
            'R600'          => $request->r_600,
        ]);

        $location = Auth::user()->role == 1 ? 'admin' : 'user';
        return redirect()->route($location.'.fluid.select', $request->FluidID);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Sample  $sample
     * @return \Illuminate\Http\Response
     */
    public function show(Sample $sample)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Sample  $sample
     * @return \Illuminate\Http\Response
     */
    public function edit(Sample $sample)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Sample  $sample
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        Sample::where('SampleID', $request->SampleID)->update([
            'Pressure'          => $request->pressure,
            'Temperature'       => $request->temperature,
            'R3'                => $request->r_3,
            'R6'                => $request->r_6,
            'R30'               => $request->r_30,
            'R60'               => $request->r_60,
            'R100'              => $request->r_100,
            'R200'              => $request->r_200,
            'R300'              => $request->r_300,
            'R600'              => $request->r_600,
        ]);

        $fluids = Fluids::where('FluidID', $request->FluidId)->first();
        Session::put('fluidInfo', $fluids);
        Session::put('selectedSampleID', $request->SampleID);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Sample  $sample
     * @return \Illuminate\Http\Response
     */

    public function getChartsSampleData(Request $request)
    {
        $sampleId = $request->sampleId;
        $sample = Sample::where('SampleID', $sampleId)->first();

        $x = array(3, 6, 30, 60, 100, 200, 300, 600);
        $y = array(
            $sample->R3,
            $sample->R6,
            $sample->R30,
            $sample->R60,
            $sample->R100,
            $sample->R200,
            $sample->R300,
            $sample->R600,
        );

        $data = array(
            'x' => $x,
            'y' => $y,
        );

        return response()->json($data);
    }
    
    public function destroy(Sample $sample)
    {
        //
    }
}
