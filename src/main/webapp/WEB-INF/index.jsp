<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
    <title>AdvaHub: Home</title>
</head>
<body>
    <%@include file="header.html"%>
    <main class="mt-2">
        <div class="container">
            <di class="row">
                <div class="col-12 text-end mb-2">
                    <a class="btn btn-primary" href="../app/new-ad.jsp">+ NEW AD HERE</a>
                </div>
            </di>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <c:forEach var="post" items="${postList}">
                        <c:forEach var="vehicle" items="${vehicleList}">
                            <c:if test="${post.vehicleId == vehicle.vehicleId}">
                                <div class="card mb-2">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-3 border">
                                                <img src="uploads/6ba9f1a1-88b3-41a2-b5a1-61e4f76e81f6" width="150" alt="">
                                                ${System.out.println(post.imageList.get(0))}
                                            </div>
                                            <div class="col-9">
                                                <h5>${vehicle.brand} ${vehicle.model} ${vehicle.yom}</h5>
                                                <div>${post.mileage} km</div>
                                                <div>${post.location}</div>
                                                <div>Rs. ${post.price} </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:forEach>

                </div>
                <div class="col-3"></div>
            </div>
        </div>
    </main>
    <%@include file="footer.html"%>
</body>
</html>