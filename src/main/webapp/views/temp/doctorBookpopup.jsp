<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">

<header></header>
<head>

<script type="text/javascript">
    function bookDoctor(){

        if (confirm("Are you sure you want to book this Doctor appointment ?") === true) {

            document.getElementById("frmBookDoctor").submit();
        }else{
            alert('cancel the book Doctor appointment');
        }
    }



</script>
</head>




<body >

<!-- Modal -->
<div class="modalX fade" id="exampleModalCenterX" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true"  >
    <div class="modal-dialog modal-dialog-centered" role="document"  >
        <form id="frmBookDoctor" name="frmBookDoctor" method="post" action="<%=request.getContextPath()%>/bookDoctor">
        <div class="modal-content " style="background-color: #1E293B;">
            <div class="modal-header">
                <h5 class="modal-title text-white" > <div id="doctorName"> </div>      </h5>
                <button type="button" class="close text-black" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-white">
                <p>certifications in fitness and exercise science. They may have completed accredited programs such as Personal Training Certification, Strength and Conditioning Certification</p>
            </div>

            <div class="modal-footer">
               <input id="selecteddoctorUsername" name="selecteddoctorUsername" type="hidden" value="">
                <input id="doctor_appointment_date" name="doctor_appointment_date" type="hidden" value="">
                <input id="selectedselectedDateField" name="selectedselectedDateField" type="hidden" value="">
                <input id="loggedloggedusername" name="loggedloggedusername" type="hidden" value="">
                <input id="startingtime" name="startingtime" type="hidden" value="" />
                <input id="startingdate" name="startingdate" type="hidden" value="" />
                <input id="adminMessage" name="adminMessage" type="hidden" value="admin message" />
                <button type="button" onclick="javascript:bookDoctor();" class="btn btn-primary">Book Now</button>
            </div>

        </div>
        </form>
    </div>
</div>
</body>

<script type="text/javascript">



</script>

</html>

