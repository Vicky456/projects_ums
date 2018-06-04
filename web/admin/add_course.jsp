

<jsp:include page="header.jsp"></jsp:include>
 <div ui-view="" class="app-body" id="view">

      <div class="p-a white lt box-shadow">
        <div class="row">
          <div class="col-sm-6">
            <h4 class="m-b-0 _300">Register Course Portal</h4>
           <!-- <small class="text-muted">university management system</small>-->
          </div>

        </div>
      </div>
 <div class="padding">

     <div class="row">
    <div class="col-sm-8 offset-sm-2">
        <form ui-jp="parsley" novalidate="" action="/projectums/add_course" method="post">
        <div class="box">
          <div class="box-header">
            <h2>Register course</h2>
          </div>
          <div class="box-body">
            <p class="text-muted">Please fill the information to continue</p>
            <div class="form-group">
              <label>Name of course</label>
              <input type="text" class="form-control" required="" name="name">                        
            </div>
            
            <div class="row m-b">
              <div class="col-sm-6">
                <label>Subject Code</label>
                <input type="text" class="form-control" disabled="" required="" name="code_sub"  value="CVS004">   
              </div>
              <div class="col-sm-3">
                <label>Year</label>
                <select class="form-control" name="year">
                    <option></option>
                    <option>2010</option>
                </select>      
              </div> 
              <div class="col-sm-3">
                <label>Batch</label>
                <input type="text" class="form-control" name="batch">      
              </div>
            </div>
            <div class="form-group">
              <label>Description</label>
              <textarea class="form-control" required="" name="desc_"></textarea>
            </div>
            <div class="checkbox">
              <label class="ui-check">
                <input type="checkbox" name="check" checked="" required="true" data-parsley-multiple="check" data-parsley-id="15"><i></i> I agree to the <a href="#" class="text-info">Terms of Service</a>
              </label>
            </div>
          </div>
          <div class="dker p-a text-right">
            <button type="submit" class="btn info">Save</button>
          </div>
        </div>
      </form>
    </div>
   
  </div>

 </div>

 </div>
<jsp:include page="fooder.jsp"></jsp:include>