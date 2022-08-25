<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\Drillstring;
use App\Models\Surfpiping;
use App\Models\WellBore;
use App\Models\WellInfo;
use App\Models\UnitForUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class WellboreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $module = 'Wellbore';
    public function index()
    {
        
        $selectedProjectId          = Session::has('projectId') ? Session::get('projectId') : 0;
        $drillstring                = Drillstring::where('ProjectID', $selectedProjectId)->get();
        $surfPiping                 = Surfpiping::where('ProjectID', $selectedProjectId)->get();
        $wellboreInfo               = WellBore::where('ProjectID', $selectedProjectId)->first();
        $wellbore                   = isset($wellboreInfo) ? $this->wellboreProcess($wellboreInfo) : '';
        $rigType                    = WellInfo::where('ProjectID', $selectedProjectId)->first();

        $lengthUnits                = DB::table('standard_unit')->where('concept_id', 5)->get();
        $diameterUnits              = DB::table('standard_unit')->where('concept_id', 6)->get();

        if (!Session::has('WBUnitIds') && !Session::has('WBUnitValues')) {
            $this->setSessionUnits();
        }

        if($rigType) $rigType       = $rigType->rigtype;
        
        if(!Session::has('selectedDrillString')){
            $selectedDrillString    = Drillstring::where('DS_ID', 1)->first();
            Session::put('selectedDrillString', $selectedDrillString);
        }

        if (Auth::user()->role == 1) {
            return view('Backend.Wellbore.index')
                ->with('module',        $this->module)
                ->with('wellbore',      $wellbore)
                ->with('drillstring',   $drillstring)
                ->with('surfpiping',    $surfPiping)
                ->with('rigType',       $rigType)
                ->with('diameterUnits', $diameterUnits)
                ->with('lengthUnits',   $lengthUnits);
    
        }else {
            return view('Frontend.Wellbore.index')
                ->with('module',        $this->module)
                ->with('wellbore',      $wellbore)
                ->with('drillstring',   $drillstring)
                ->with('surfpiping',    $surfPiping)
                ->with('rigType',       $rigType)
                ->with('diameterUnits', $diameterUnits)
                ->with('lengthUnits',   $lengthUnits);
    
        }
    }

    public function wellboreProcess($wellboreCollection){
        $riser = array();
        $csg = array();
        $lfirst = array();
        $lsecond = array();
        $hole = array();
        $collection = array();
        $wellbore = $wellboreCollection->toArray();
        foreach($wellbore as $key => $item){
            if(strpos($key, 'Riser') !== false){
                $riser[$key] = $item;
            }elseif (strpos($key, 'Csg') !== false) {
                $csg[$key] = $item;
            }elseif (strpos($key, 'L1') !== false) {
                $lfirst[$key] = $item;
            }elseif (strpos($key, 'L2') !== false) {
                $lsecond[$key] = $item;
            }elseif (strpos($key, 'Hole') !== false) {
                $hole[$key] = $item;
            }
        }
        $collection = [
            'riser' => $riser,
            'csg' => $csg,
            'lfirst' => $lfirst,
            'lsecond' => $lsecond,
            'hole' => $hole,
            'wellboreId' => $wellbore['WellboreID'],
        ];
        $collection = json_decode(json_encode($collection));
        return $collection;
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
    public function drillStringUpdate(Request $request)
    {
        DB::table('drillstring')->where('DS_ID', $request->ds_id)->update([
            'Bit_type'          => $request->bit_type,
            'Bit_position'      => $request->position,
            'Bit_size'          => $request->size,
            'Bit_TFA'           => $request->tfa,
            'N0_N'              => $request->N0_N,
            'N0_SIZE'           => $request->N0_SIZE,
            'N1_N'              => $request->N1_N,
            'N1_SIZE'           => $request->N1_SIZE,
            'N2_N'              => $request->N2_N,
            'N2_SIZE'           => $request->N2_SIZE,
        ]);

        $drillstring = DB::table('drillstring')->where('DS_ID', $request->ds_id)->first();
        Session::put('selectedDrillString', $drillstring);

        return 1;
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
       Session::put('WBUnitValues', $unitValues);
       Session::put('WBUnitIds', $unitIds);
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

        $length             = DB::table('standard_unit')->where('id', $length_id)->first()->value;
        $diameter           = DB::table('standard_unit')->where('id', $diameter_id)->first()->value;

        $unitValues         = array(
            'length'            => $length,
            'diameter'          => $diameter,
        );

        $unitIds = array(
            'length_id'     => $length_id,
            'diameter_id'   => $diameter_id,
        );

        $unitValues         = json_encode($unitValues);
        $unitIds            = json_encode($unitIds);
        Session::put('WBUnitValues',    $unitValues);
        Session::put('WBUnitIds',       $unitIds);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\WellBore  $wellBore
     * @return \Illuminate\Http\Response
     */
    public function show(WellBore $wellBore)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\WellBore  $wellBore
     * @return \Illuminate\Http\Response
     */
    public function edit(WellBore $wellBore)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\WellBore  $wellBore
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        Wellbore::where('WellboreID', $request->wellbore_id)->update([
            'RiserDescription'      => $request->riserDescription,
            'RiserOD'               => $request->riserOd,
            'RiserID'               => $request->riserId,
            'RiserTop'              => $request->riserTopMD,
            'RiserBottom'           => $request->riserBottomMD,
            'RiserWeight'           => $request->riserWeight,
            'RiserActive'           => $request->riserActive,

            'CsgDescription'        => $request->csgDescription,
            'CsgOD'                 => $request->csgOD,
            'CsgID'                 => $request->csgID,
            'CsgTop'                => $request->csgTopMD,
            'CsgBottom'             => $request->csgBottomMD,
            'CsgWeight'             => $request->csgWeight,

            'L1Description'         => $request->lfirstDescription,
            'L1OD'                  => $request->lfirstOD,
            'L1ID'                  => $request->lfirstID,
            'L1Top'                 => $request->lfirstTopMD,
            'L1Bottom'              => $request->lfirstBottomMD,
            'L1Weight'              => $request->lfirstWeight,
            'L1Active'              => $request->lfirstActive,

            'L2Description'         => $request->lsecondDescription,
            'L2OD'                  => $request->lsecondOD,
            'L2ID'                  => $request->lsecondID,
            'L2Top'                 => $request->lsecondTopMD,
            'L2Bottom'              => $request->lsecondBottomMD,
            'L2Weight'              => $request->lsecondWeight,
            'L2Active'              => $request->lsecondActive,

            'HoleDescription'       => $request->holeDescription,
            'HoleID'                => $request->holeID,
            'HoleOD'                => $request->holeOD,
            'HoleTop'               => $request->holeTopMD,
            'HoleBottom'            => $request->holeBottomMD,
            'HoleWeight'            => $request->holeWeight,
        ]);

        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\WellBore  $wellBore
     * @return \Illuminate\Http\Response
     */
    public function destroy(WellBore $wellBore)
    {
        //
    }
}
