<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\Drillstring;
use App\Models\Surfpiping;
use App\Models\WellBore;
use App\Models\WellInfo;
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
        //
        $selectedProjectId = Session::get('projectId');
        $drillstring = Drillstring::where('ProjectID', $selectedProjectId)->get();
        $surfPiping = Surfpiping::where('ProjectID', $selectedProjectId)->get();
        $wellboreInfo = WellBore::where('ProjectID', $selectedProjectId)->first();
        $wellbore = $this->wellboreProcess($wellboreInfo);
        $rigType = WellInfo::where('ProjectID', $selectedProjectId)->first()->rigtype;
        if(!Session::has('selectedDrillString')){
            $selectedDrillString = Drillstring::where('DS_ID', 1)->first();
            Session::put('selectedDrillString', $selectedDrillString);
        }

        if (Auth::user()->role == 1) {
            return view('Backend.Wellbore.index')->with('module', $this->module)
                ->with('wellbore', $wellbore)
                ->with('drillstring', $drillstring)
                ->with('surfpiping', $surfPiping)
                ->with('rigType', $rigType);
        }else {
            return view('Frontend.Wellbore.index')->with('module', $this->module)
                ->with('wellbore', $wellbore)
                ->with('drillstring', $drillstring)
                ->with('surfpiping', $surfPiping)
                ->with('rigType', $rigType);
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
            'RiserDescription' => $request->riserDescription,
            'RiserOD' => $request->riserOd,
            'RiserID' => $request->riserId,
            'RiserTop' => $request->riserTopMD,
            'RiserBottom' => $request->riserBottomMD,
            'RiserWeight' => $request->riserWeight,
            'RiserActive' => $request->riserActive,

            'CsgDescription' => $request->csgDescription,
            'CsgOD' => $request->csgOD,
            'CsgID' => $request->csgID,
            'CsgTop' => $request->csgTopMD,
            'CsgBottom' => $request->csgBottomMD,
            'CsgWeight' => $request->csgWeight,

            'L1Description' => $request->lfirstDescription,
            'L1OD' => $request->lfirstOD,
            'L1ID' => $request->lfirstID,
            'L1Top' => $request->lfirstTopMD,
            'L1Bottom' => $request->lfirstBottomMD,
            'L1Weight' => $request->lfirstWeight,
            'L1Active' => $request->lfirstActive,

            'L2Description' => $request->lsecondDescription,
            'L2OD' => $request->lsecondOD,
            'L2ID' => $request->lsecondID,
            'L2Top' => $request->lsecondTopMD,
            'L2Bottom' => $request->lsecondBottomMD,
            'L2Weight' => $request->lsecondWeight,
            'L2Active' => $request->lsecondActive,

            'HoleDescription' => $request->holeDescription,
            'HoleID' => $request->holeID,
            'HoleOD' => $request->holeOD,
            'HoleTop' => $request->holeTopMD,
            'HoleBottom' => $request->holeBottomMD,
            'HoleWeight' => $request->holeWeight,
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
