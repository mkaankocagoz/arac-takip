<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AracMarka;
use App\Models\AracModel;
use App\Models\TamirTuru;
use App\Models\Musteri;
use App\Models\Tamir;
use Illuminate\Support\Facades\DB;

class FormController extends Controller
{
    public function index(){
       
        $arac_marka = AracMarka::get();
        $tamir_turu = TamirTuru::get();

        return view('form', compact('arac_marka', 'tamir_turu'));
    }

    public function get_models(Request $request){
        $arac_model = AracModel::where('marka_id', $request->marka_id)->get();
        return response()->json($arac_model);
    }

    public function tamir_yeri(Request $request){
        $tamir_yeri = DB::table('tamir_turu')
                    ->join('tamir_relationship', 'tamir_turu.id', 'tamir_relationship.tamir_turu_id')
                    ->join('tamir_yeri', 'tamir_yeri.id', 'tamir_relationship.tamir_yeri_id')
                    ->where('tamir_turu.id', $request->tamir_turu_id)->get();

        return response()->json($tamir_yeri);
    }

    public function tamir(Request $request){
        $musteri = Musteri::where('musteri_adi', 'LIKE', $request->form_data['musteri'])->first();
        if($musteri){
            $musteri_id = $musteri->id;
        }else{
            $musteri = new Musteri();
            $musteri->musteri_adi = $request->form_data['musteri'];
            $musteri->save();
            $musteri_id = $musteri->id;
        }

        $tarih_kontrol = Tamir::where('tamir_yeri_id', $request->form_data['tamir_yeri'])
                                ->where('tamir_tarihi', $request->form_data['tamir_tarihi'])->first();
        if($tarih_kontrol)     
            return response()->json(['status'=>2, 'message'=>'Seçilen tarihte tamir yeri doludur.']);                   

        $tamir = new Tamir();
        $tamir->marka_id = $request->form_data['arac_marka'];
        $tamir->model_id = $request->form_data['arac_model'];
        $tamir->musteri_id = $musteri_id;
        $tamir->tamir_turu_id = $request->form_data['tamir_turu'];
        $tamir->tamir_yeri_id = $request->form_data['tamir_yeri'];
        $tamir->tamir_tarihi = $request->form_data['tamir_tarihi'];
        $tamir->save();

        return response()->json(['status'=>1]);
    }
}
