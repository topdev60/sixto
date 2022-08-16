<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

use App\Models\Popressure;
use App\Models\Lithology;
use App\Models\Temperature;
use Laravel\Ui\Presets\React;

class SimulationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $module = 'Simulation';
    public function index()
    {
        $location = Auth::user()->role == 1 ? 'Backend' : 'Frontend';
        return view($location.'.Simulation.index')->with('module', $this->module);
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
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }


    /**
     *
     * retrive data from Pressure, Pore pessure, Temperature Gradient and Temperature with Selected Project Id
     *
     */

    public function getDataSimulation(Request $request)
    {
        $selectedProjectId          = $request->project_id;

        $porepressure               = Popressure::where('ProjectID', $selectedProjectId)->get();
        $temperature                = Temperature::where('ProjectID', $selectedProjectId)->get();

        $xtitle                     = 'TVD axis';
        if($porepressure){
            $x = []; $y = []; $z = [];
            foreach($porepressure as $key => $item){
                array_push($x, $item->TVD);
                array_push($y, $item->Pressure);
                array_push($z, $item->PP);
            }
            $porepressureData       = array(
                'x' => $x,
                'y' => $y,
                'z' => $z,
                'title' => array(
                    'xtitle' => $xtitle,
                    'ytitle' => 'Pore Pressure Axis'
                ),
            );

            $pressureData           = array(
                'x'                     => $x,
                'y'                     => $z,
                'z'                     => $y,
                'title'                 => array(
                    'xtitle'                => $xtitle,
                    'ytitle'                => 'Pressure Axis'
                ),
            );
        }
        if($temperature){
            $x = []; $y = []; $z = [];
            foreach ($temperature as $key => $item) {
                array_push($x, $item->TVD);
                array_push($y, $item->Temperature);
                array_push($z, $item->TG);
            }
            $temperatureData        = array(
                'x'                     => $x,
                'y'                     => $y,
                'z'                     => $z,
                'title'                     => array(
                    'xtitle' => $xtitle,
                    'ytitle' => 'Temperature Axis'
                ),
            );
            $temperatureGradientData = array(
                'x'                     => $x,
                'y'                     => $z,
                'z'                     => $y,
                'title'                     => array(
                    'xtitle'                    => $xtitle,
                    'ytitle'                    => 'Temperature Gradient Axis'
                ),
            );
        }

        $data = array(
            'pressureData'              => $pressureData,
            'porepressureData'          => $porepressureData,
            'temperatureData'           => $temperatureData,
            'temperatureGradientData'   => $temperatureGradientData
        );

        return response()->json($data);
    }

    public function getDataSimulationGuageAndSlider(Request $request)
    {
        $selectedProjectId              = $request->project_id;

        $porepressure                   = Popressure::where('ProjectID', $selectedProjectId)->get();
        $temperature                    = Temperature::where('ProjectID', $selectedProjectId)->get();

        if ($porepressure) {
            $pressureValue              = 0;
            $ppValue                    = 0;
            foreach ($porepressure as $key => $item) {
                $pressureValue          += $item->Pressure;
                $ppValue                += $item->PP;
            };
        }

        if ($temperature) {
            $temperatureValue           = 0;
            $tgValue                    = 0;
            foreach ($temperature as $key => $item) {
                $temperatureValue       += $item->Temperature;
                $tgValue                += $item->TG;
            };
        }

        $data = array(
            'guage'                     => array(
                'pressure'                  => $pressureValue,
                'ppValue'                   => $ppValue,
                'temperature'               => $temperatureValue,
                'tgValue'                   => $tgValue,
                // 'title'                     => array(
                //     'pressure'              => 'Pressure',
                //     'temperature'           => 'Temperature',
                // )
            ),

            // 'slider'                    => array(
            //     // 'title'                     => array(
            //     //     'pp'                      => 'Pore Pressure',
            //     //     'tg'                      => 'Temperature Gradient',
            //     // )
            // ),
        );

        return response()->json($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
