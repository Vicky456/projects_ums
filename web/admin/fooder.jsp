
    
  </div>

</div>

<!--<script src="../asstes/app.html.js"></script>-->
<script src="../asstes/jquery-3.3.1.js"></script>

<script>
   document.body.className="pace-done pace-done black";
   </script>
   
   <script>
    $('.nav_exp').click(function (){
         let ck=false;
        if($(this).hasClass("active")){
            ck=true;
        }
        
        $(this).addClass("_act");
       $('.nav_exp').removeClass("active");
       
       if(!ck)
       $("._act").addClass("active").removeClass("_act");
        else
        $("._act").removeClass("active").removeClass("_act");
    });
   </script>
       
</body>
</html>