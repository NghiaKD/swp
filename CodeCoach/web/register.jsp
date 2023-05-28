<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:30 GMT -->

    <head>
        <meta charset="utf-8">
        <title>Mentoring</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#searchInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#dropdownList option").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>

    </head>

    <body class="account-page">

        <div class="main-wrapper">

            <div class="bg-pattern-style bg-pattern-style-register">
                <div class="content">

                    <div class="account-content">
                        <div class="account-box">
                            <div class="login-right">
                                <div class="login-header">
                                    <h3><span>Mentoring</span> Register</h3>
                                    <p class="text-muted">Access to our dashboard</p>
                                </div>

                                <form action="register" method="post">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label">First Name</label>
                                                <input id="first-name" type="text" class="form-control" name="first_name"
                                                       autofocus>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label">Last Name</label>
                                                <input id="last-name" type="text" class="form-control" name="last_name">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        Gender :
                                        <label for="male">Male</label>
                                        <input type="radio" id="male" name="gender" value="male">

                                        <label for="female">Female</label>
                                        <input type="radio" id="female" name="gender" value="female">
                                    </div>

                                    <div class="form-group">
                                        <label class="form-control-label">Email Address</label>
                                        <input id="email" type="email" class="form-control" name="email">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Phone Number</label>
                                        <input id="phonenumber" type="text" class="form-control" name="phone_number">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Address</label>
                                        <input id="address" type="text" class="form-control" name="address">
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label">City</label>
                                                <select name="" id="cityList" onchange="changeCity()">
                                                    <option value="" selected=""></option>
                                                    <c:forEach items="${requestScope.listCity}" var="i">
                                                        <option value="${i.mattp}">${i.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label">District</label>
                                                <br>
                                                <select name="district" id="district" style="display: none">

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Facebook</label>
                                        <input id="facebook" type="text" class="form-control" name="facebook">
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label">Password</label>
                                                <input id="password" type="password" class="form-control" name="password">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label">Confirm Password</label>
                                                <input id="password-confirm" type="password" class="form-control"
                                                       name="password_confirmation">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-check form-check-xs custom-checkbox">
                                            <input type="checkbox" class="form-check-input" name="agreeCheckboxUser"
                                                   id="agree_checkbox_user">
                                            <label class="form-check-label" for="agree_checkbox_user">I agree to
                                                Mentoring</label> <a tabindex="-1" href="javascript:void(0);">Privacy
                                                Policy</a> &amp; <a tabindex="-1" href="javascript:void(0);"> Terms.</a>
                                        </div>
                                    </div>
                                    <button class="btn btn-primary login-btn" type="submit" name="create">Create
                                        Account</button>
                                    <div class="account-footer text-center mt-3">
                                        Already have an account? <a class="forgot-link mb-0" href="login.html">Login</a>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <script type="text/javascript">
            function changeCity() {
                $.ajax({
                    type: 'POST',
                    data: {
                        id: $('#cityList').val()
                    },
                    url: '${pageContext.request.contextPath}/chooseDistrict',
                    success: function (data, textStatus, jqXHR) {
                        if($('#cityList').val() !== ''){
                            $('#district').css("display","inline");
                        }
                        else{
                            $('#district').css("display","none");
                        }
                        $('#district').html(data)
                    }
                }
                )
            }
        </script>

        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/script.js"></script>

    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:30 GMT -->

</html>