<%-- 
    Document   : index
    Created on : Jul 11, 2012, 7:27:02 PM
    Author     : Luckma
--%>

<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Sistem Informasi Data Kayawan</title>
            <link rel="stylesheet" href="custom/admin/screen.css" type="text/css" media="screen" title="default">
                <!--  jquery core -->
                <script src="custom/admin/jquery-1.4.1.min.js" type="text/javascript"></script>

                <!-- Custom jquery scripts -->
                <script src="custom/admin/custom_jquery.js" type="text/javascript"></script>

                <!-- The main core JS -->
                <script src="custom/admin/jquery.purr.js" type="text/javascript"></script>   
                <script src="custom/admin/jquery.validate.js" type="text/javascript"></script>	
                <script src="custom/admin/main.js" type="text/javascript"></script>

                <!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
                <script src="custom/admin/jquery.pngFix.pack.js" type="text/javascript"></script>
                <script type="text/javascript">
                    $(document).ready(function(){
                        $(document).pngFix( );
                    });
                </script>	
                </head>
                <body id="login-bg"> 


                    <!-- Start: login-holder -->
                    <div id="login-holder">


                        <div class="clear"></div>
                        <div id="logo">
                            <div id="logo_login">
                                <a href="#"><img src="custom/admin/logo.png" alt=""></a>
                            </div>
                        </div>
                        <!--  start loginbox ................................................................................. -->
                        <div id="loginbox">
                            <!-- start logo -->

                            <!-- end logo -->

                            <!--  start login-inner -->
                            <div id="login-inner">
                                <form action="Login" method="post" accept-charset="utf-8">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <th><label class="login-label">Username</label></th>
                                                <td><input type="text" class="required login-inp" minlength="4" name="username"></td>
                                            </tr>
                                            <tr>
                                                <th><label class="login-label">Password</label></th>
                                                <td><input type="password" value="" class="required login-inp" name="password" minlength="4"></td>
                                            </tr>

                                            <tr>
                                                <th></th>
                                                <td valign="top"><input type="checkbox" class="checkbox-size" id="login-check"><label for="login-check">Remember me</label></td>
                                            </tr>
                                            <tr>
                                                <th></th>
                                                <td><input type="submit" class="submit-login"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                            <!--  end login-inner -->
                            <div class="clear"></div>
                            <a href="" class="forgot-pwd">Forgot Password?</a>
                        </div>
                        <!--  end loginbox -->

                        <!--  start forgotbox ................................................................................... -->
                        <div id="forgotbox">
                            <div id="forgotbox-text">Please send us your email and we'll reset your password.</div>
                            <!--  start forgot-inner -->
                            <div id="forgot-inner">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr>
                                            <th> Email :</th>
                                            <td><input type="text" value="" class="login-inp"></td>
                                        </tr>
                                        <tr>
                                            <th> </th>
                                            <td><input type="button" class="submit-login"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--  end forgot-inner -->
                            <div class="clear"></div>
                            <a href="" class="back-login">Back to login</a>
                        </div>
                        <!--  end forgotbox -->

                    </div>
                    <!-- End: login-holder -->

                </body>
                </html>