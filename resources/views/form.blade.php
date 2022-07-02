@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Araç Takip Formu</div>

                <div class="card-body">
                    

                <form action="javascript:void()"; id="arac_takip_form">
                    <div class="form-group row">
                        <label for="arac_marka" class="col-sm-3 col-form-label">Araç Markası :</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="arac_marka" name="arac_marka" onchange="get_model()" required>
                                <option value="">Seçiniz...</option>
                                @foreach($arac_marka as $item)
                                    <option value="{{ $item->id }}">{{ $item->arac_marka }}</option>
                                @endforeach
                            </select>                        
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="arac_modeli" class="col-sm-3 col-form-label">Araç Modeli :</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="arac_modeli" name="arac_modeli" required>
                                <option value="">Seçiniz...</option>
                            </select>                        
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="musteri_adi" class="col-sm-3 col-form-label">Müşteri Adı :</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="musteri_adi" name="musteri_adi" required>                       
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="tamir_turu" class="col-sm-3 col-form-label">Tamir Türü :</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="tamir_turu" name="tamir_turu" onchange="tamir_yeri()" required>
                                <option value="">Seçiniz...</option>
                                @foreach($tamir_turu as $item)
                                    <option value="{{ $item->id }}">{{ $item->tamir_turu }}</option>
                                @endforeach
                            </select>                        
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="select_tamir_yeri" class="col-sm-3 col-form-label">Tamir Yeri :</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="select_tamir_yeri" name="select_tamir_yeri" required>
                                <option value="">Seçiniz...</option>
                            </select>                        
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="tamir_tarihi" class="col-sm-3 col-form-label  mb-3">Tamir Tarihi :</label>
                        <div class="col-sm-9 mb-3">
                            <input type="date" class="form-control" id="tamir_tarihi" name="tamir_tarihi" required>                       
                        </div>
                        
                        <label for="tamir_tarihi" class="col-sm-2 col-form-label">Saat :</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="tamir_saati" name="tamir_saati" required>
                                @for($i=1; $i<25; $i++)
                                    <option value="{{ $i }}">{{ $i }}</option>
                                @endfor
                            </select>                       
                        </div>

                        <label for="tamir_tarihi" class="col-sm-2 col-form-label">Dakika :</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="tamir_dakika" name="tamir_dakika" required>
                                <option value="00">00</option>
                                <option value="30">30</option>
                            </select>                      
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>


                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function get_model(){
        var marka_id = document.getElementById("arac_marka").value;

        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: "{{ url('get_models') }}",
            type: "POST",
            data:{
                'marka_id' : marka_id
                },
            success:function(data){
                $("#arac_modeli").empty();
                var select = $("#arac_modeli");
                for (let i = 0; i < data.length; i++) {
                    select.append('<option value="' + data[i].id + '">' + data[i].model + '</option>');
                }

            },
            error:function(e){
                console.log(e,'error');
            }
        });
    }

    function tamir_yeri(){
        var tamir_turu_id = document.getElementById("tamir_turu").value;

        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: "{{ url('tamir_yeri') }}",
            type: "POST",
            data:{
                'tamir_turu_id' : tamir_turu_id
                },
            success:function(data){
                $("#select_tamir_yeri").empty();
                var select = $("#select_tamir_yeri");
                for (let i = 0; i < data.length; i++) {
                    select.append('<option value="' + data[i].id + '">' + data[i].tamir_yeri + '</option>');
                }
            },
            error:function(e){
                console.log(e,'error');
            }
        });
    }

    $("#arac_takip_form").submit(function(event) {

        /* stop form from submitting normally */
        event.preventDefault();
        var form_data = {
            arac_marka: document.getElementById('arac_marka').value,
            arac_model: document.getElementById('arac_modeli').value,
            musteri: document.getElementById('musteri_adi').value,
            tamir_turu: document.getElementById('tamir_turu').value,
            tamir_yeri: document.getElementById('select_tamir_yeri').value,
            tamir_tarihi: document.getElementById('tamir_tarihi').value+ ' ' +document.getElementById('tamir_saati').value+':'+document.getElementById('tamir_dakika').value,
        }
        
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: "{{ url('tamir') }}",
            type: "POST",
            data:{
                'form_data' : form_data
                },
            success:function(data){
                if(data.status == 1)
                    location.reload();
                if(data.status == 2)
                    alert(data.message);
            },
            error:function(e){
                console.log(e,'error');
            }
        });

    });
</script>

@endsection
