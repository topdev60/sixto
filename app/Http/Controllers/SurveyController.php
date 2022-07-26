<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;
    
use App\Models\Survey;
use App\Models\UnitForUser;

use App\Exports\ExportSurvey;
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
        $defaultUnit        = UnitForUser::select('Length')->where('UserID', Auth::id())->first();
        $userLengthUnitId   = $defaultUnit->Length != null ? $defaultUnit->Length : 22;

        if(!Session::has('unitLenID') && !Session::has('unitLenValue')){
            $this->setSessionLenUnit($userLengthUnitId);
        }

        $lengthUnits = DB::table('standard_unit')->where('concept_id', 5)->get();
        if(Auth::user()->role == 1){
            if(Session::has('projectId')){
                $trajactories = Survey::where('projectID', Session::get('projectId'))->orderby('id', 'asc')->paginate(10);
            }else {
                $trajactories = Survey::all();
            }
            return view('Backend.Trajectory.index')
                ->with('trajectories', $trajactories)
                ->with('module', $this->module)
                ->with('lengthUnits', $lengthUnits);
        }else {
            $trajactories = Survey::where('projectID', Session::get('projectId'))->orderby('id', 'asc')->paginate(10);
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
        $this->setSessionLenUnit($length_id);
        return 1;
    }

    public function setSessionLenUnit($id)
    {
        $length = DB::table('standard_unit')->where('id', $id)->first()->value;

        $unitLenValue = $length;
        $unitLenID = $id;
        // dd($unitLenValue);
        Session::put('unitLenValue', $unitLenValue);
        Session::put('unitLenID', $unitLenID);
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

    public function deleteAllRows($id)
    {
        $projectId = Session::get('projectId');
        Survey::where('ProjectID', $projectId)->delete();
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
            Survey::insert([
                'ProjectID' => $projectId,
                'MD' => $row[0],
                'Inc' => $row[1],
                'Azimuth' => $row[2],
                'TVD' => $row[3],
                'North' => $row[4],
                'East' => $row[5]
            ]);
        }

        return 1;
    }

    public function export()
    {
        $projectId = Session::get('projectId');
        return Excel::download(new ExportSurvey($projectId), 'survey.xlsx');
    }
}
