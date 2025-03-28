<nav class="navbar <%= request.getAttribute("currentPage") %>">
    <a href="/infinityGaming/welcome-home.jsp" class="navbar-brand">
        <img src="/infinityGaming/images/logo.png" alt="Logo Infinity Gaming" class="logo">
    </a>

    
    <div class="navbar-center">
        <ul class="nav">
            <li class="nav-item"><a href="/infinityGaming/catalogo?piattaforma=PC" class="nav-link">PC</a></li>
            <li class="nav-item"><a href="/infinityGaming/catalogo?piattaforma=PZ" class="nav-link">PlayZtation</a></li>
            <li class="nav-item"><a href="/infinityGaming/catalogo?piattaforma=YBOX" class="nav-link">Ybox</a></li>
            <li class="nav-item"><a href="/infinityGaming/catalogo?piattaforma=NOENTIENDO" class="nav-link">NoEntiendo</a></li>
        </ul>
    </div>

    
    <form class="d-flex search-bar" action="/infinityGaming/catalogo" method="GET" aria-label="Search bar">
        <input class="form-control me-2" type="search" name="query" placeholder="Cerca giochi" aria-label="Cerca">
        <button class="btn btn-outline-light" type="submit">Cerca</button>
    </form>

    
    <div class="navbar-icons">
     <a href="/infinityGaming/catalogo" class="btn btn-outline-light ms-2" aria-label="Sfoglia catalogo">
        SFOGLIA
    </a>
    <form action="logout" method="post">
    	<button type="submit" class="btn btn-outline-light ms-2" aria-label="logout">
        LOGOUT
    	</button>
    </form>
        <a href="/infinityGaming/utente" aria-label="Vai al profilo">
            <img src="/infinityGaming/images/man.png" alt="Profilo utente" class="icon">
        </a>
        <a href="javascript:void(0);" id="carrello-btn" aria-label="Visualizza carrello">
            <img src="/infinityGaming/images/shopping-cart.png" alt="Carrello acquisti" class="icon">
        </a>
    </div>
</nav>