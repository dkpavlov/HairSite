<form class="form">
    <input type="text" placeholder="Name" class="form-input"/>

    <br/>

    <textarea rows="5" cols="20" placeholder="Describe yourself with 4 words..." class="form-input"></textarea>

    <br/>

    <textarea rows="5" cols="20" placeholder="Describe yourself with 4 words..." class="form-input"></textarea>

    <br/>

    <input type="file" name="Главно изображение"/>

    <br/>

    <div id="images">
        <label>Изображения</label>   <br/>
        <input type="file" name="Изображение" class="form-input"/>
        <br/>
    </div>
    <input type="button" value="Добави изображение" id="add-image"/>
    <br/>

    <input type="submit" class="form-input"/>
</form>

<script>
    $(document).ready(function(){
        $("#add-image").click(function(){
            $("#images").append('<input type="file" name="Изображение" class="form-input"/><br/>');
        });
    });
</script>