
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME PAGE</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
        <style type="text/css">
            @import url('https://fonts.googleapis.com/css?family=Montserrat');
            #body-row {
                margin-left: 0;
                margin-right: 0;
            }
            #sidebar-container {
                min-height: 77vh;
                background-color: #42f587;
                padding: 20px;
                /* flex: unset; */
            }
            .sidebar-expanded {
                width: 300px;
            }
            .sidebar-collapsed {
                width: 100px;
            }   
            #sidebar-container .list-group a {
                height: 100px;
                color: black;
                font-size: 25px
            }  
            #sidebar-container .list-group li.list-group-item {
                background-color: #42f587;
            }
            #sidebar-container .list-group .sidebar-submenu a {
                height: 45px;
                padding-left: 30px;
                color: black;
            }
            .sidebar-submenu {
                font-size: 0.9rem;
            } 
            .sidebar-separator-title {
                background-color: #222222;
                height: 35px;
            }
            .sidebar-separator {
                background-color: #222222;
                height: 25px;
            }
            .logo-separator {
                background-color: #222222;
                height: 60px;
            }
            a.bg-dark {
                background-color: #42f587 !important;
            }
            .menu-collapsed:hover{
                color: #4260f5;
            }
            #sidebar-container .list-group .sidebar-submenu a:hover{
                color: white;
                text-decoration: none;
            }
            .col{
                background-color: cornsilk;
            }

        </style>

    </head>
    <body>
        <div class="container-fluid p-0">
            <div class="row" id="body-row">
                <div id="sidebar-container" class="sidebar-expanded d-none d-md-block">
                    <ul class="list-group">
                        <c:if test="${not empty  sessionScope.LOGIN_USER}">
                            <a href="#" class="bg-dark list-group-item list-group-item-action">
                                <div class="d-flex w-100 justify-content-start align-items-center">
                                    <!--<span class="fa fa-user fa-fw mr-3"></span>-->
                                    <span class="menu-collapsed">Hi,
                                        <span class="menu-collapsed">${sessionScope.LOGIN_USER.getName()}</span>
                                    </span>    
                                </div>
                            </a>   
                        </c:if>
                        <c:if test="${empty  sessionScope.LOGIN_USER}">
                            <a href="login.jsp" class="bg-dark list-group-item list-group-item-action">
                                <div class="d-flex w-100 justify-content-start align-items-center">
                                    <!--<span class="fa fa-user fa-fw mr-3"></span>-->
                                    <span class="menu-collapsed mr-3">Login</span>    
                                </div>
                            </a> 
                            <a href="signup.jsp" class="bg-dark list-group-item list-group-item-action">
                                <div class="d-flex w-100 justify-content-start align-items-center">
                                    <!--<span class="fa fa-user fa-fw mr-3"></span>-->
                                    <span class="menu-collapsed mr-3">SignUp</span>    
                                </div>
                            </a> 
                        </c:if>
                        <a href="#submenu2" data-toggle="collapse" aria-expanded="false" class="bg-dark list-group-item list-group-item-action flex-column align-items-start">
                            <div class="d-flex w-100 justify-content-start align-items-center">
                                <!--<span class="fa fa-tasks fa-fw mr-3"></span>-->
                                <span class="menu-collapsed">Categories</span>
                                <span class="submenu-icon ml-auto"></span>
                            </div>
                        </a>
                        <div id='submenu2' class="collapse sidebar-submenu">
                            <c:set var="listCate" value="${sessionScope.LISTCATE}"/>
                            <c:forEach items="${listCate}" var="o">
                                <li class="list-group-item text-white"><a href=MainController?action=searchByCate&cateID=${o.categoryID}>${o.categoryName}</a></li>
                                </c:forEach>
                        </div>
                            <c:set var="USER" value="${sessionScope.LOGIN_USER}"/>
                            <c:if test="${USER.roleID ne 'AD'}">
                        <a href="MainController?action=viewCartPage" class="bg-dark list-group-item list-group-item-action">
                            <div class="d-flex w-100 justify-content-start align-items-center">
                                <!--<span class="fas fa-shopping-cart mr-3"></span>-->
                                <span class="menu-collapsed mr-3">View Cart</span>    
                                <span id="quantityCart"></span>
                            </div>
                        </a>
                        </c:if>
                        <c:set var="USER" value="${sessionScope.LOGIN_USER}"/>
                        <c:if test="${USER.roleID eq 'GU'}">
                        <a href="MainController?action=historyPage" class="bg-dark list-group-item list-group-item-action">
                            <div class="d-flex w-100 justify-content-start align-items-center">
                                <!--<span class="fas fa-history mr-3"></span>-->
                                <span class="menu-collapsed mr-3">History</span>    
                            </div>
                        </a>
                        </c:if>


                        <c:if test="${not empty  sessionScope.LOGIN_USER}">
                            <a href="MainController?action=Logout" class="bg-dark list-group-item list-group-item-action">
                                <div class="d-flex w-100 justify-content-start align-items-center">
                                    <!--<span class="fas fa-sign-out-alt mr-3"></span>-->
                                    <span class="menu-collapsed">Logout</span>    
                                </div>
                            </a>
                        </c:if>
                    </ul>
                </div>
                        <div class="col" style="background-color: #defaff">
                    <h1>
                        <nav class="navbar navbar-light bg-light justify-content-between">
                            
                            <form class="form-inline" action="MainController">
                                <input class="form-control mr-sm-2" type="search" name="valueSearch" placeholder="Search" aria-label="Search">
                                <button  name="action" value="searchByName" type="submit">
                                <img src="img/timkiem.jpg" alt="khong_co_hinh" style="height:40px">
                                </button>
                            </form>
                            <a class="navbar-brand" href="MainController?action=homePage">
                            <img src="img/home.jpg" alt="khong_co_hinh" style="height:40px; background: #7afa89"></a>
                        </nav>
                    </h1>
                    <c:set var="USER" value="${sessionScope.LOGIN_USER}"/>
                    <c:if test="${USER.roleID eq 'AD'}">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="background-color: black; margin-right: 840px">
                        Add Product
                    </button>
                    <a href="MainController?action=createDiscountPage">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="background-color: black">
                        Create Discount
                    </button>
                        </a>
                    </c:if>

                    <!-- Modal -->
                    <div id="exampleModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="MainController" method="POST">
                                    <c:set var="err" value="${requestScope.ERROR_PRODUCT}"/>
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Add Product</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>ID Product</label>
                                            <input name="idproduct" type="text"  class="form-control" required>
                                            <c:if test="${not empty err.productIDError}">
                                                <p style="color: red">${err.productIDError}</p>
                                            </c:if>
                                        </div>
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input name="name" type="text" class="form-control" required>
                                            <c:if test="${not empty err.productNameError}">
                                                <p style="color: red">${err.productNameError}</p>
                                            </c:if>
                                        </div>
                                        <div class="form-group">
                                            <label>Image</label>
                                            <input name="image" type="text" class="form-control" required>
                                            <c:if test="${not empty err.imgError}">
                                                <p style="color: red">${err.imgError}</p>
                                            </c:if>
                                        </div>
                                        <div class="form-group">
                                            <label>Price</label>
                                            <input name="price" type="number" min="1" class="form-control" required>
                                            <c:if test="${not empty err.priceError}">
                                                <p style="color: red">${err.priceError}</p>
                                            </c:if>
                                        </div>
                                        <div class="form-group">
                                            <label>Quantity</label>
                                            <input name="quantity" type="number" min="1" class="form-control" required>
                                            <c:if test="${not empty err.quantityError}">
                                                <p style="color: red">${err.quantityError}</p>
                                            </c:if>
                                        </div>
                                        <div class="form-group">
                                            <label>Author</label>
                                            <input name="author" type="text" class="form-control" required>
                                            <c:if test="${not empty err.authorError}">
                                                <p style="color: red">${err.authorError}</p>
                                            </c:if>
                                        </div>
                                        <div class="form-group">
                                            <label>Description</label>
                                            <textarea name="description" class="form-control" required></textarea>
                                            <c:if test="${not empty err.descriptionError}">
                                                <p style="color: red">${err.descriptionError}</p>
                                            </c:if>
                                        </div>
                                        <div class="form-group">
                                            <label>ID Category</label>
                                            <select name="idcategory" class="form-select" aria-label="Default select example">
                                                <c:forEach items="${listCate}" var="o">
                                                    <option value="${o.categoryID}">${o.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                        <input type="submit" name="action" class="btn btn-success" value="Add">
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>


                    <c:if test="${not empty requestScope.OUT_OF_STOCK}">
                        <h2 style="color: red;">${requestScope.OUT_OF_STOCK}</h2>
                    </c:if>

                    <c:set var="USER" value="${sessionScope.LOGIN_USER}"/>   

                    <c:set var="listProduct" value="${requestScope.listProduct}"/>
                    <div class="row" style="background-color: #defaff"> 
                        <c:forEach var="item" items="${listProduct}">
                            <div class="col-3">
                                <div class="card" style="height: 500px; width: 280px; margin-top: 20px; margin-bottom: 30px;">
                                    <img class="card-img-top"  style="width: 100%; height: 250px" src="${item.productImg}" alt="abc" />
                                    <div class="card-body">
                                        <h5 class="card-title" style="color: red">${item.productName}</h5>
                                        <p class="card-text">Price: ${item.price}$ </p>
                                        <p class="card-text" style="color: black">Số lượng: ${item.quantity}</p>
                                    </div>
                                    <p style="text-align: center">


                                        <c:if test="${USER.roleID ne 'AD'}">
                                        <form action="MainController">
                                            <c:if test="${requestScope.productIDError eq item.productID}">
                                                <c:if test="${empty requestScope.OUT_OF_STOCK}">
                                                    <button style="width: 100%; height: 50px" name="action"  value="checkUnitQuantityProduct" type="submit" class="btn btn-success" >
                                                        Add To Cart
                                                    </button>
                                                    <input type="hidden" name="proID" value="${item.productID}" />
                                                    <input type="hidden" name="proName" value="${item.productName}" />
                                                    <input type="hidden" name="proImg" value="${item.productImg}" />
                                                    <input type="hidden" name="proPrice" value="${item.price}" />
                                                    <input type="hidden" name="proCate" value="${item.categoryID}" />
                                                    <input type="hidden" name="actionPrimary" value="addCart" />
                                                    <input type="hidden" name="actionSearch" value="${requestScope.ACTIONSEARCH}" />
                                                    <input type="hidden" name="searchValue" value="${param.valueSearch}" />
                                                    <input type="hidden" name="cateID" value="${param.cateID}" />
                                                </c:if>
                                                <c:if test="${not empty requestScope.OUT_OF_STOCK}">
                                                    <button style="width: 70%; height: 45px" name="action"  value="checkUnitQuantityProduct" type="submit" class="btn btn-success"  disabled>
                                                        Maximum Quantity
                                                    </button>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${requestScope.productIDError ne item.productID}">
                                                <button  name="action"  value="checkUnitQuantityProduct" type="submit" style="display: right">
                                                    <img src="img/giohang.jpg" alt="khong_co_hinh" style="width:50px">
                                                </button>
                                                <input type="hidden" name="proID" value="${item.productID}" />
                                                <input type="hidden" name="proName" value="${item.productName}" />
                                                <input type="hidden" name="proImg" value="${item.productImg}" />
                                                <input type="hidden" name="proPrice" value="${item.price}" />
                                                <input type="hidden" name="proCate" value="${item.categoryID}" />
                                                <input type="hidden" name="actionPrimary" value="addCart" />


                                                <input type="hidden" name="actionSearch" value="${requestScope.ACTIONSEARCH}" />
                                                <input type="hidden" name="searchValue" value="${param.valueSearch}" />
                                                <input type="hidden" name="cateID" value="${param.cateID}" />
                                            </c:if>
                                        </form>
                                    </c:if>

                                    <c:if test="${USER.roleID eq 'AD'}">
                                        <c:url var="urlUpdateProduct" value="MainController">
                                            <c:param name="action" value="updateProductPage"/>
                                            <c:param name="proID" value="${item.productID}"/>
                                            <c:param name="actionSearch" value="${requestScope.ACTIONSEARCH}"/>
                                            <c:param name="searchValue" value="${param.valueSearch}"/>
                                            <c:param name="cateID" value="${param.cateID}"/>
                                        </c:url>
                                        <a href="${urlUpdateProduct}" style="background-color: none; margin-right: 45px">Update</a>
                                        <c:url var="urlDeleteProduct" value="MainController">
                                            <c:param name="action" value="removeProduct"/>
                                            <c:param name="proID" value="${item.productID}"/>
                                            <c:param name="actionSearch" value="${requestScope.ACTIONSEARCH}"/>
                                            <c:param name="searchValue" value="${param.valueSearch}"/>
                                            <c:param name="cateID" value="${param.cateID}"/>
                                        </c:url>
                                        <c:if test="${item.quantity > 0}">
                                            <a href="${urlDeleteProduct}" style="background-color: none;color: red">Remove</a>    
                                        </c:if>
                                        <c:if test="${item.quantity <= 0}">
                                            <button disabled class="btn btn-danger">Remove</button>    
                                        </c:if>
                                    </c:if>
                                </div>   
                            </div>   
                        </c:forEach>
                    </div>
                </div>
            </div>
            <c:set var="map" value="${sessionScope.CART.cartProduct}"/>
            <script type="text/javascript">
                document.getElementById("quantityCart").textContent =${map.size()};
            </script>
            <%@include file="footer.jsp" %>


    </body>
</html>
