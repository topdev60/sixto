<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;

use App\Models\Survey;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SurveyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $module = 'Survey';
    public function index()
    {
        $lengthUnits = DB::table('standard_unit')->where('concept_id', 5)->get();
        if(Auth::user()->role == 1){
            if(Session::has('projectId')){
                $trajactories = Survey::where('projectID', Session::get('projectId'))->paginate(10);
            }else {
                $trajactories = Survey::all();
            }
            return view('Backend.Trajectory.index')
                ->with('trajectories', $trajactories)
                ->with('module', $this->module)
                ->with('lengthUnits', $lengthUnits);
        }else {
            $trajactories = Survey::where('projectID', Session::get('projectId'))->paginate(10);
            return view('Frontend.Trajectory.index')
                ->with('trajectories', $trajactories)
                ->with('module', $this->module)
                ->with('lengthUnits', $lengthUnits);
        }
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
        $projectId = Session::get('projectId');
        $new = Survey::insert([
            'ProjectID' => $projectId,
            'MD' => $request->md,
            'Inc' => $request->inc,
            'Azimuth' => $request->azi,
            'TVD' => $request->tvd,
            'North' => $request->north,
            'East' => $request->east,
        ]);
        if($new) return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Surevey  $surevey
     * @return \Illuminate\Http\Response
     */
    public function show(Survey $survey)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Surevey  $surevey
     * @return \Illuminate\Http\Response
     */
    public function edit(Survey $survey)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Surevey  $surevey
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Survey $survey)
    {
        //
    }

    public function setUnit(Request $request)
    {
        $length_id = isset($request->length) ? $request->length : 22;
        $length = DB::table('standard_unit')->where('id', $length_id)->first()->value;

        $unitLenValue = $length;
        $unitLenID = $length_id;
        // dd($unitLenValue);
        Session::put('unitLenValue', $unitLenValue);
        Session::put('unitLenID', $unitLenID);
        return 1;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Surevey  $surevey
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $trajId = $request->id;
        Survey::where('id', $trajId)->delete();
        return redirect()->back();
    }
}
