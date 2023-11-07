<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-size=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
    <title>AdvaHub: New Post</title>
</head>
<body>
    <%@include file="WEB-INF/header.html"%>
    <main>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2>ADD NEW ADVERTISEMENT</h2>
                    <form action="/app/add" enctype="multipart/form-data" method="POST">
                        <div class="row">
                            <div class="col-6">
                                <div class="row mt-3 g-3 align-items-center">
                                    <div class="col-auto">
                                        <label for="txt-brand" class="col-form-label">Brand</label>
                                    </div>
                                    <div class="col-auto">
                                        <input name="brand" type="text" id="txt-brand" class="form-control">
                                    </div>
                                </div>

                                <div class="row mt-3 g-3 align-items-center">
                                    <div class="col-auto">
                                        <label for="txt-model" class="col-form-label">Model</label>
                                    </div>
                                    <div class="col-auto">
                                        <input name="model" type="text" id="txt-model" class="form-control">
                                    </div>
                                </div>

                                <div class="row mt-3 g-3 align-items-center">
                                    <div class="col-auto">
                                        <label for="txt-yom" class="col-form-label">Year of Man.</label>
                                    </div>
                                    <div class="col-auto">
                                        <input name="yom" type="text" id="txt-yom" class="form-control">
                                    </div>
                                </div>

                                <div class="row mt-3 g-3 align-items-center">
                                    <div class="col-auto">
                                        <label for="txt-capacity" class="col-form-label">Engine Capacity</label>
                                    </div>
                                    <div class="col-auto">
                                        <input name="capacity" type="text" id="txt-capacity" class="form-control">
                                    </div>
                                </div>

                                <div class="row mt-3 g-3 align-items-center">
                                    <div class="col-auto">
                                        <label for="txt-fuel" class="col-form-label">Fuel Type</label>
                                    </div>
                                    <div class="col-auto">
                                        <input name="fuel" type="text" id="txt-fuel" class="form-control">
                                    </div>
                                </div>

                                <div class="row mt-3 g-3 align-items-center">
                                    <div class="col-auto">
                                        <label for="txt-condition" class="col-form-label">Condition</label>
                                    </div>
                                    <div class="col-auto">
                                        <input name="condition" type="text" id="txt-condition" class="form-control">
                                    </div>
                                </div>

                            </div>
                            <div class="col-6">
                                <div class="row mt-3 g-3 align-items-center">
                                    <div class="col-auto">
                                        <label for="txt-mileage" class="col-form-label">Mileage</label>
                                    </div>
                                    <div class="col-auto">
                                        <input name="mileage" type="text" id="txt-mileage" class="form-control">
                                    </div>
                                </div>

                                <div class="row mt-3 g-3 align-items-center">
                                    <div class="col-auto">
                                        <label for="txt-contact" class="col-form-label">Contact No.</label>
                                    </div>
                                    <div class="col-auto">
                                        <input name="contact" type="text" id="txt-contact" class="form-control">
                                    </div>
                                </div>

                                <div class="row mt-3 g-3 align-items-center">
                                    <div class="col-auto">
                                        <label for="txt-location" class="col-form-label">Location</label>
                                    </div>
                                    <div class="col-auto">
                                        <input name="location" type="text" id="txt-location" class="form-control">
                                    </div>
                                </div>

                                <div class="row mt-3 g-3 align-items-center">
                                    <div class="col-auto">
                                        <label for="txt-district" class="col-form-label">District</label>
                                    </div>
                                    <div class="col-auto">
                                        <input name="district" type="text" id="txt-district" class="form-control">
                                    </div>
                                </div>

                                <div class="row mt-3 g-3 align-items-center">
                                    <div class="col-auto">
                                        <label for="txt-price" class="col-form-label">Price</label>
                                    </div>
                                    <div class="col-auto">
                                        <input name="price" type="text" id="txt-price" class="form-control">
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <div class="row mt-3 g-3 align-items-center">
                                    <div class="col-2">
                                        <label for="txt-description" class="col-form-label">Description</label>
                                    </div>
                                    <div class="col-10">
                                        <textarea name="description" class="form-control" id="txt-description" rows="10"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <div class="d-flex gap-3">
                                    <button class="btn btn-success">SAVE</button>
                                    <button class="btn btn-warning">RESET</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
    <%@include file="WEB-INF/footer.html"%>
</body>
</html>