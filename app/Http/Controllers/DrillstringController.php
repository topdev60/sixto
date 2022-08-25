<?php

namespace App\Http\Controllers;

use App\Models\Drillstring;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;

use App\Models\UnitForUser;
use App\Models\DsComp;
use Illuminate\Support\Facades\Session;
use Laravel\Ui\Presets\React;

use App\Exports\ExportDrillString;

class DrillstringController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $module = 'DrillString';
    public function index()
    {
        $location = '';
        $selectedProjectId  = Session::get('projectId');
        $drillStrings       = Drillstring::where('ProjectID', $selectedProjectId)->orderby('DS_ID', 'asc')->get();

        // $pressureUnits      = DB::table('standard_unit')->where('concept_id', 1)->get();
        // $tempUnits          = DB::table('standard_unit')->where('concept_id', 2)->get();
        // $densityUnits       = DB::table('standard_unit')->where('concept_id', 3)->get();
        // $flowUnits          = DB::table('standard_unit')->where('concept_id', 4)->get();
        $lengthUnits          = DB::table('standard_unit')->where('concept_id', 5)->get();
        $diameterUnits        = DB::table('standard_unit')->where('concept_id', 6)->get();

        if (!Session::has('DSUnitIds') && !Session::has('DSUnitValues')) {
            $this->setSessionUnits();
        }
        if(!Session::has('dsInfo')){
            $dsInfo         = Drillstring::where('DS_ID', 1)->first();
            Session::put('dsInfo', $dsInfo);
        }
        if ( Auth::user()->role == 1 ) {
            $location       = 'Backend';
        }else{
            $location       = 'Frontend';
        }
        return view($location.'.Drillstring.index')
            ->with('module',        $this->module)
            ->with('drillStrings',  $drillStrings)
            ->with('diameterUnits', $diameterUnits)
            ->with('lengthUnits',   $lengthUnits);
    }

    public function setunit(Request $request)
    {
        // dd($request->length, $request->diameter);
       $length_id       = isset($request->length)     ? $request->length   : 22;
       $diameter_id     = isset($request->diameter)   ? $request->diameter : 26;


       $length          = DB::table('standard_unit')->where('id', $length_id)->first()->value;
       $diameter        = DB::table('standard_unit')->where('id', $diameter_id)->first()->value;

       $unitValues = array(
           'length'     => $length,
           'diameter'   => $diameter,
       );

       $unitIds = array(
           'length_id'   => $length_id,
           'diameter_id' => $diameter_id,
       );

       $unitValues = json_encode($unitValues);
       $unitIds = json_encode($unitIds);
       Session::put('DSUnitValues', $unitValues);
       Session::put('DSUnitIds', $unitIds);
       return 1;
   }

   public function setSessionUnits()
    {
        // $userPressureId     = UnitForUser::select('Pressure')->where('UserID', Auth::id())->first();
        // $userTemperatureId  = UnitForUser::select('Temperature')->where('UserID', Auth::id())->first();
        // $userDensityId      = UnitForUser::select('Density')->where('UserID', Auth::id())->first();
        // $userFlowId         = UnitForUser::select('Flow')->where('UserID', Auth::id())->first();
        $userLengthId       = UnitForUser::select('Length')->where('UserID', Auth::id())->first();
        $userDiameterId     = UnitForUser::select('Diameter')->where('UserID', Auth::id())->first();

        // $pressure_id        = $userPressureId->Pressure != null ? $userPressureId->Pressure: 1;
        // $temp_id            = $userTemperatureId->Temperature != null ? $userTemperatureId->Temperature : 5;
        // $density_id         = $userDensityId->Density != null ? $userDensityId->Density : 16;
        $length_id          = $userLengthId->Length;
        $diameter_id        = $userDiameterId->Diameter;

        $length     = DB::table('standard_unit')->where('id', $length_id)->first()->value;
        $diameter   = DB::table('standard_unit')->where('id', $diameter_id)->first()->value;

        $unitValues = array(
            'length'     => $length,
            'diameter'   => $diameter,
        );
 
        $unitIds = array(
            'length_id'   => $length_id,
            'diameter_id' => $diameter_id,
        );
 
        $unitValues = json_encode($unitValues);
        $unitIds = json_encode($unitIds);
        Session::put('DSUnitValues', $unitValues);
        Session::put('DSUnitIds', $unitIds);
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
    public function comp_store(Request $request)
    {
        DsComp::insert([
            'DS_ID' => $request->ds_id,
            'Description' => $request->comp_decription,
            'OD' => $request->comp_od,
            'ID' => $request->comp_id,
            'TJ' => $request->comp_tj,
            'Weight' => $request->comp_weight,
            'Length' => $request->comp_length,
        ]);

        return redirect()->back();
    }

    public function store(Request $request)
    {
        Drillstring::insert([
            'ProjectID' => $request->projectId,
            'Description' => $request->decription,
            // 'Bit_type' => $request->bit_type,
            // 'Bit_position' => $request->bit_position,
            // 'Bit_Size' => $request->bit_size,
            // 'Bit_TFA' => $request->bit_tfa,
            // 'PWD_Distance' => $request->pwd_distance,
            // 'PWD_Drop' => $request->pwd_drop,
        ]);

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Drillstring  $drillstring
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $ds_id = $request->selectDrillstring;
        $dsInfo = Drillstring::where('DS_ID', $ds_id)->first();
        Session::put('dsInfo', $dsInfo);
        $location = 'user';
        if(Auth::user()->role == 1) $location = 'admin';
        return redirect()->route($location.'.drillstring.index');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Drillstring  $drillstring
     * @return \Illuminate\Http\Response
     */
    public function edit(Drillstring $drillstring)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Drillstring  $drillstring
     * @return \Illuminate\Http\Response
     */

    public function update(Request $request)
    {
        Drillstring::where('DS_ID', $request->DS_ID)->update([
            'Description' => $request->description,
        ]);
        return redirect()->back();
    }
    public function comp_update(Request $request)
    {
        DsComp::where('Comp_ID', $request->id)->update([
            'DS_ID' => $request->ds_id,
            'Description' => $request->comp_decription,
            'OD' => $request->comp_od,
            'ID' => $request->comp_id,
            'TJ' => $request->comp_tj,
            'Weight' => $request->comp_weight,
            'Length' => $request->comp_length,
        ]);

        return redirect()->back();
    }

    public function getDrillStringData(Request $request)
    {
        $drillstringId = $request->drillstringId;
        $selectedDrillString = Drillstring::where('DS_ID', $drillstringId)->first();
        Session::put('selectedDrillString', $selectedDrillString);

        $nozzles = DB::table('nozzle')->where('DS_ID', $drillstringId)->get();
        Session::put('nozzles', $nozzles);

        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Drillstring  $drillstring
     * @return \Illuminate\Http\Response
     */

    public function destroy(Request $request)
    {
        Drillstring::where('DS_ID', $request->DS_ID)->delete();
        Session::forget('dsInfo');
        $location = 'user';
        if(Auth::user()->role == 1) $location = 'admin';
        return redirect()->route($location.'.drillstring.index');
    }

    public function comp_destroy(Request $request)
    {
        DsComp::where('Comp_ID', $request->id)->delete();
        return redirect()->back();
    }

    public function comp_all_destroy($ds_id)
    {
        DsComp::where('DS_ID', $ds_id)->delete();
        return redirect()->back();
    }

    public function storePasteData(Request $request)
    {
        $dsInfo = session()->get('dsInfo');
        $ds_id = $dsInfo->DS_ID;
        $rows = $request->rows;
        $rows = json_decode($rows);
        $newRows = [];
        unset($rows[count($rows)-1]); //because last element has "" value
        foreach ($rows as $key => $row) {
            $row = str_replace("\r", "", $row);
            $row = explode("\t", $row);
            DsComp::insert([
                'DS_ID'         => $ds_id,
                'Description'   => $row[0],
                'ID'            => $row[1],
                'OD'            => $row[2],
                'Weight'        => $row[3],
                'Length'        => $row[4],
                'TJ'            => $row[5],
            ]);
        }

        return 1;
    }

    public function export()
    {
        $dsInfo = session()->get('dsInfo');
        $ds_id = $dsInfo->DS_ID;
        return Excel::download(new ExportDrillString($ds_id), $dsInfo->Description.'.xlsx');
    }
}
