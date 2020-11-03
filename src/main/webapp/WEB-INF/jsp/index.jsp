<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html lang="en">
<head>
    <!--
	<spring:url value="/css/main.css" var="springCss" />
	<link href="${springCss}" rel="stylesheet" />
	 -->
    <c:url value="/css/main.css" var="jstlCss"/>
    <link href="${jstlCss}" rel="stylesheet"/>

    <link href="webjars/bootstrap/4.1.0/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body>
<header>
    <div class="collapse bg-dark" id="navbarHeader">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-md-7 py-4">
                    <h4 class="text-white">About</h4>
                    <p class="text-muted">Add some information about the album below, the author, or any other
                        background context. Make it a few sentences long so folks can pick up some informative tidbits.
                        Then, link them off to some social networking sites or contact information.</p>
                </div>
                <div class="col-sm-4 offset-md-1 py-4">
                    <h4 class="text-white">Contact</h4>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white">Follow on Twitter</a></li>
                        <li><a href="#" class="text-white">Like on Facebook</a></li>
                        <li><a href="#" class="text-white">Email me</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="navbar navbar-dark bg-dark box-shadow">
        <div class="container d-flex justify-content-between">
            <a href="#" class="navbar-brand d-flex align-items-center">
                <img id="logo_img" src="${pageContext.request.contextPath}/img/logo.svg" alt="">
                <strong>Flower watering</strong>
            </a>
        </div>
    </div>
</header>

<main role="main">

    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading">Automatic water flower</h1>
            <p class="lead text-muted">Something short and leading about the collection below—its contents, the creator,
                etc. Make it short and sweet, but not too short so folks don't simply skip over it entirely.</p>
            <p>
                <button class="btn btn-primary my-2" data-toggle="modal" data-target="#createModal">Add Flower</button>
            </p>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row">
                <c:forEach var="flower" items="#{flowers}">
                    <div class="col-md-4">
                        <div class="card mb-4 box-shadow">
                            <img class="card-img-top"
                                 src="${pageContext.request.contextPath}/<c:out value="${flower.img}"/>"
                                 alt="Card image cap">
                            <div class="card-body">
                                <h3><c:out value="${flower.name}"/></h3>
                                <p class="card-text"><c:out value="${flower.description}"/></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-success">Water now</button>
                                        <button onclick="onUpdate(${flower.id})" type="button"
                                                class="btn btn-sm btn-outline-secondary">Edit
                                        </button>
                                        <button type="button" onclick="onDeleteSubmit(${flower.id})" class="btn btn-sm btn-outline-secondary">Delete
                                        </button>
                                    </div>
                                    <small class="text-muted">9 mins</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- The Modal -->
    <div class="modal" id="createModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">New flower</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="img">Image:</label>
                            <input type="text" class="form-control" id="img" name="img" required>
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <textarea class="form-control" rows="5" id="description"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" onclick="onCreateSubmit()" class="btn btn-success">Create</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- The Modal -->
    <div class="modal" id="updateModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Update flower</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form>
                        <input type="hidden" class="form-control" id="updId" name="id">
                        <div class="form-group">
                            <label for="updName">Name:</label>
                            <input type="text" class="form-control" id="updName" name="name">
                        </div>
                        <div class="form-group">
                            <label for="updImg">Image:</label>
                            <input type="text" class="form-control" id="updImg" name="img">
                        </div>
                        <div class="form-group">
                            <label for="updDescription">Description:</label>
                            <textarea class="form-control" rows="5" id="updDescription"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" onclick="onUpdateSubmit()" class="btn btn-success">Update</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</main>

<footer class="text-muted">
    <div class="container">
        <p class="float-right">
            <a href="#">Back to top</a>
        </p>
        <p>Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
        <p>New to Bootstrap? <a href="../../">Visit the homepage</a> or read our <a href="../../getting-started/">getting
            started guide</a>.</p>
    </div>
</footer>
<script src="webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script>
    var onUpdate = function (id) {
        var updFlower;
        $.get("/flowers/" + id, function (data) {
            updFlower = data;
            if (updFlower) {
                $('#updId').val(data.id);
                $('#updName').val(data.name);
                $('#updImg').val(data.img);
                $('#updDescription').val(data.description);

                $('#updateModal').modal('show');
            }
        });
    }

    var onUpdateSubmit = function () {
        var id = $('#updId').val()
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            type: "POST",
            url: "/flowers/update/" + id,
            data: JSON.stringify({
                id: id,
                name: $('#updName').val(),
                img: $('#updImg').val(),
                description: $('#updDescription').val()
            }),
            dataType: "json"
        }).always(() => {
            window.location.replace('/')
        })
    }

    var onCreateSubmit = function () {
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            type: "POST",
            url: "/flowers/create",
            data: JSON.stringify({
                name: $('#name').val(),
                img: $('#img').val(),
                description: $('#description').val()
            }),
            dataType: "json"
        }).always(() => {
            window.location.replace('/')
        })
    }

    var onDeleteSubmit = function (id) {
        $.ajax({
            type: "POST",
            url: "/flowers/delete/" + id
        }).always(() => {
            window.location.replace('/')
        })
    }
</script>
</body>
</html>
