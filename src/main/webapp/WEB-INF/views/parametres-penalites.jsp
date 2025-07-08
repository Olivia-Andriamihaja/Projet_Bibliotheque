<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Paramètres des Pénalités</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh;
            background: linear-gradient(135deg, #8B4513 0%, #D2691E 25%, #F4A460 50%, #DEB887 75%, #F5DEB3 100%);
            font-family: 'Georgia', 'Times New Roman', serif;
            position: relative;
        }

        /* Effet de texture papier ancien */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                radial-gradient(circle at 20% 80%, rgba(120, 119, 108, 0.2) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255, 255, 255, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 40% 40%, rgba(139, 69, 19, 0.15) 0%, transparent 50%);
            pointer-events: none;
            z-index: 1;
        }

        .sidebar {
            width: 280px;
            background: linear-gradient(180deg, #654321 0%, #8B4513 100%);
            color: #F5DEB3;
            min-height: 100vh;
            padding: 30px 20px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            box-shadow: 4px 0 20px rgba(0,0,0,0.3);
            border-right: 3px solid #D2691E;
        }

        .sidebar::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url("data:image/svg+xml,%3Csvg width='40' height='40' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23D2691E' fill-opacity='0.1'%3E%3Cpath d='M20 0L0 20L20 40L40 20L20 0Z'/%3E%3C/g%3E%3C/svg%3E");
            opacity: 0.3;
        }

        .sidebar-header {
            display: flex;
            align-items: center;
            margin-bottom: 40px;
            position: relative;
            z-index: 2;
        }

        .sidebar-logo {
            width: 50px;
            height: 50px;
            background: linear-gradient(145deg, #D2691E, #F4A460);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
        }

        .sidebar-logo::before {
            content: '🏛️';
            font-size: 24px;
        }

        .sidebar h2 {
            color: #F5DEB3;
            margin: 0;
            font-size: 1.5em;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            position: relative;
            z-index: 2;
        }

        .sidebar a {
            display: block;
            color: #F5DEB3;
            text-decoration: none;
            margin: 12px 0;
            padding: 15px 20px;
            border-radius: 10px;
            transition: all 0.3s ease;
            position: relative;
            z-index: 2;
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(245, 222, 179, 0.2);
            font-weight: 500;
        }

        .sidebar a::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, transparent, rgba(245, 222, 179, 0.1), transparent);
            border-radius: 10px;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .sidebar a:hover::before {
            opacity: 1;
        }

        .sidebar a.btn-emprunt {
            background: linear-gradient(145deg, #D2691E, #F4A460);
            color: #654321;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .sidebar a:hover, .sidebar .btn-emprunt:hover {
            background: linear-gradient(145deg, #F4A460, #D2691E);
            color: #654321;
            transform: translateX(5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.3);
        }

        .sidebar a.active {
            background: linear-gradient(145deg, #F4A460, #D2691E);
            color: #654321;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .btn-logout {
            background: linear-gradient(145deg, #8B0000, #DC143C);
            color: #F5DEB3;
            border: none;
            border-radius: 10px;
            padding: 15px 20px;
            margin-top: 30px;
            cursor: pointer;
            font-size: 1em;
            font-weight: bold;
            transition: all 0.3s ease;
            font-family: 'Georgia', serif;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            position: relative;
            z-index: 2;
            width: 100%;
        }

        .btn-logout:hover {
            background: linear-gradient(145deg, #DC143C, #8B0000);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.3);
        }

        .main-content {
            flex: 1;
            padding: 40px;
            margin-left: 280px;
            position: relative;
            z-index: 2;
        }

        .main-header {
            background: linear-gradient(145deg, #FAEBD7, #F5F5DC);
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 40px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            border: 2px solid #D2691E;
            position: relative;
        }

        .main-header::before {
            content: '';
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            background: linear-gradient(45deg, #D2691E, #F4A460, #D2691E);
            border-radius: 20px;
            z-index: -1;
            opacity: 0.3;
        }

        .main-header h1 {
            color: #654321;
            font-size: 2.5em;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            margin: 0;
            text-align: center;
            position: relative;
        }

        .main-header h1::before {
            content: '⚙️';
            margin-right: 20px;
            font-size: 0.8em;
        }

        .main-header h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 200px;
            height: 3px;
            background: linear-gradient(90deg, #8B4513, #D2691E, #8B4513);
            border-radius: 2px;
        }

        .config-container {
            background: linear-gradient(145deg, #FAEBD7, #F5F5DC);
            border: 3px solid #D2691E;
            border-radius: 20px;
            padding: 25px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            max-width: 800px;
            position: relative;
            overflow: hidden;
        }

        .config-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, transparent, rgba(245, 222, 179, 0.3), transparent);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .config-container:hover::before {
            opacity: 1;
        }

        .param-card {
            border: 2px solid #D2691E;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            background: linear-gradient(145deg, #FFF8DC, #FAEBD7);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            position: relative;
            transition: all 0.3s ease;
            overflow: visible;
        }

        .param-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.3);
        }

        .param-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, transparent, rgba(245, 222, 179, 0.3), transparent);
            opacity: 0;
            transition: opacity 0.3s ease;
            z-index: 1;
            pointer-events: none;
        }

        .param-card:hover::before {
            opacity: 1;
        }

        .param-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .param-title {
            font-size: 1.2em;
            font-weight: bold;
            color: #654321;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }

        .param-title::before {
            content: '⚙️ ';
            margin-right: 5px;
        }

        .param-value {
            font-size: 1.5em;
            font-weight: bold;
            color: #228B22;
        }

        .param-description {
            color: #8B4513;
            font-size: 1em;
            margin-bottom: 15px;
        }

        .param-description::before {
            content: 'ℹ️ ';
            margin-right: 5px;
        }

        .param-form {
            display: flex;
            gap: 10px;
            align-items: center;
            position: relative;
            z-index: 5;
        }

        .param-input {
            width: 100px;
            padding: 8px;
            border: 2px solid #D2691E;
            border-radius: 10px;
            text-align: center;
            font-size: 1em;
            color: #654321;
            font-family: 'Georgia', serif;
            transition: all 0.3s ease;
            position: relative;
            z-index: 10;
            background: rgba(255, 255, 255, 0.8);
            outline: none;
            pointer-events: auto;
            user-select: text;
        }

        .param-input:focus {
            border-color: #F4A460;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            background: #fff;
        }

        .btn-update {
            background: linear-gradient(145deg, #228B22, #32CD32);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 10px;
            cursor: pointer;
            font-size: 0.9em;
            font-weight: bold;
            transition: all 0.3s ease;
            font-family: 'Georgia', serif;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            position: relative;
            overflow: hidden;
        }

        .btn-update::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s ease;
        }

        .btn-update:hover::before {
            left: 100%;
        }

        .btn-update:hover {
            background: linear-gradient(145deg, #32CD32, #228B22);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.3);
        }

        .info-box {
            background: linear-gradient(145deg, #FFF8DC, #FAEBD7);
            border: 2px solid #D2691E;
            border-radius: 15px;
            padding: 15px;
            margin: 20px 0;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            position: relative;
            overflow: hidden;
        }

        .info-box::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, transparent, rgba(245, 222, 179, 0.3), transparent);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .info-box:hover::before {
            opacity: 1;
        }

        .info-box h3 {
            color: #654321;
            font-size: 1.5em;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
            margin-bottom: 10px;
        }

        .info-box p, .info-box ul {
            color: #8B4513;
            font-size: 1em;
        }

        .info-box ul li::before {
            content: '📌 ';
            margin-right: 5px;
        }

        .example-box {
            background: linear-gradient(145deg, #FFF8DC, #FAEBD7);
            border: 2px solid #D2691E;
            border-radius: 15px;
            padding: 15px;
            margin: 15px 0;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            position: relative;
            overflow: hidden;
        }

        .example-box::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, transparent, rgba(245, 222, 179, 0.3), transparent);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .example-box:hover::before {
            opacity: 1;
        }

        .example-box h3 {
            color: #654321;
            font-size: 1.5em;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
            margin-bottom: 10px;
        }

        .example-box p, .example-box ul {
            color: #8B4513;
            font-size: 1em;
        }

        .alert {
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 15px;
            font-size: 1.1em;
            font-weight: 500;
            position: relative;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .alert-success {
            color: #155724;
            background: linear-gradient(145deg, #d4edda, #c3e6cb);
            border: 2px solid #28a745;
        }

        .alert-success::before {
            content: '✅ ';
            font-size: 1.3em;
            margin-right: 10px;
        }

        .alert-error {
            color: #721c24;
            background: linear-gradient(145deg, #f8d7da, #f5c6cb);
            border: 2px solid #dc3545;
        }

        .alert-error::before {
            content: '❌ ';
            font-size: 1.3em;
            margin-right: 10px;
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .config-container {
                padding: 20px;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                position: static;
                min-height: auto;
                padding: 20px;
            }
            
            .main-content {
                margin-left: 0;
                padding: 20px;
            }
            
            .main-header h1 {
                font-size: 2em;
            }
            
            .param-form {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .param-input {
                width: 100%;
            }
        }

        @media (max-width: 480px) {
            .config-container {
                padding: 15px;
            }
            
            .param-card {
                padding: 15px;
            }
            
            .main-header {
                padding: 20px;
            }
            
            .main-header h1 {
                font-size: 1.6em;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo"></div>
            <h2>Menu</h2>
        </div>
        <a href="${pageContext.request.contextPath}/livres">🏠 Accueil</a>
        <c:if test="${isAdmin}">
            <a href="${pageContext.request.contextPath}/emprunt/nouveau" class="btn-emprunt">📖 Emprunter un livre</a>
            <a href="${pageContext.request.contextPath}/emprunt/retour-sur-place">📚 Retour lecture sur place</a>
            <a href="${pageContext.request.contextPath}/emprunt/prolongement">⏰ Prolonger un emprunt</a>
            <a href="${pageContext.request.contextPath}/penalite/gestion">⚖️ Gestion des pénalités</a>
            <a href="${pageContext.request.contextPath}/penalite/parametres" class="active">⚙️ Paramètres des pénalités</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/reservation/mes-reservations">📋 Mes réservations</a>
        <a href="${pageContext.request.contextPath}/penalite/mes-penalites">💰 Mes pénalités</a>
        <form action="${pageContext.request.contextPath}/logout" method="post" style="margin:0;">
            <button type="submit" class="btn-logout">🚪 Déconnexion</button>
        </form>
    </div>
    
    <div class="main-content">
        <div class="main-header">
            <h1>Paramètres des Pénalités</h1>
        </div>
        
        <!-- Messages d'alerte -->
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        
        <div class="config-container">
            <div class="info-box">
                <h3>Configuration Actuelle</h3>
                <p><strong>${config}</strong></p>
            </div>

            <!-- Paramètres modifiables -->
            <c:forEach items="${parametres}" var="param">
                <div class="param-card">
                    <div class="param-header">
                        <div>
                            <div class="param-title">
                                <c:choose>
                                    <c:when test="${param.nomParametre == 'JOURS_GRACE'}">🕐 Période de grâce</c:when>
                                    <c:when test="${param.nomParametre == 'PENALITE_BASE_JOURS'}">⏱️ Pénalité de base</c:when>
                                    <c:when test="${param.nomParametre == 'PENALITE_PAR_JOUR_RETARD'}">📈 Pénalité par jour de retard</c:when>
                                    <c:otherwise>${param.nomParametre}</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="param-value">${param.valeur} jour(s)</div>
                    </div>
                    
                    <div class="param-description">${param.description}</div>
                    
                    <form action="${pageContext.request.contextPath}/penalite/parametres/modifier" method="post" class="param-form">
                        <input type="hidden" name="parametre" value="${param.nomParametre}">
                        <label for="valeur_${param.nomParametre}">Nouvelle valeur :</label>
                        <input type="number" 
                               id="valeur_${param.nomParametre}" 
                               name="valeur" 
                               value="${param.valeur}" 
                               min="0" 
                               max="365" 
                               class="param-input" 
                               required 
                               step="1" 
                               aria-label="Nouvelle valeur pour ${param.nomParametre}">
                        <button type="submit" class="btn-update">Modifier</button>
                    </form>
                </div>
            </c:forEach>
            
            <div class="example-box">
                <h3>Simulation avec les paramètres actuels</h3>
                <div id="simulation">
                    <p><strong>Exemple :</strong> Un livre devait être rendu le 1er juillet, mais est rendu le 10 juillet (9 jours de retard)</p>
                    <div id="calcul-simulation"></div>
                </div>
            </div>
            
            <div class="info-box">
                <h3>Comment ça fonctionne</h3>
                <ul>
                    <li><strong>Période de grâce :</strong> Délai accordé après la date d'échéance avant d'appliquer une pénalité</li>
                    <li><strong>Pénalité de base :</strong> Durée minimale de blocage des emprunts</li>
                    <li><strong>Pénalité par jour :</strong> Jours supplémentaires ajoutés pour chaque jour de retard au-delà de la grâce</li>
                </ul>
                <p><strong>Formule :</strong> Pénalité = Base + ((Jours de retard - Grâce) × Pénalité par jour)</p>
            </div>
        </div>
    </div>

    <script>
        function calculerSimulation() {
            const inputs = document.querySelectorAll('input[name="valeur"][type="number"]');
            const joursGrace = inputs[0] ? parseInt(inputs[0].value) || 3 : 3;
            const penaliteBase = inputs[1] ? parseInt(inputs[1].value) || 7 : 7;
            const penaliteParJour = inputs[2] ? parseInt(inputs[2].value) || 2 : 2;

            console.log('Simulation - Jours de grâce:', joursGrace, 'Pénalité de base:', penaliteBase, 'Pénalité par jour:', penaliteParJour);

            const joursRetard = 9; // Exemple fixe
            const joursRetardEffectif = Math.max(0, joursRetard - joursGrace);
            const penaliteTotal = penaliteBase + (joursRetardEffectif * penaliteParJour);

            const simulationDiv = document.getElementById('calcul-simulation');
            if (simulationDiv) {
                simulationDiv.innerHTML = `
                    <ul>
                        <li>Retard réel : ${joursRetard} jours</li>
                        <li>Période de grâce : ${joursGrace} jours → Retard effectif : ${joursRetard} - ${joursGrace} = ${joursRetardEffectif} jours</li>
                        <li>Calcul : ${penaliteBase} jours (base) + (${joursRetardEffectif} × ${penaliteParJour}) = <strong>${penaliteTotal} jours de pénalité</strong></li>
                    </ul>
                    <p><strong>Résultat :</strong> L'utilisateur ne pourra pas emprunter pendant ${penaliteTotal} jours</p>
                `;
            } else {
                console.error('Élément #calcul-simulation non trouvé');
            }
        }

        function initializeInputs() {
            const inputs = document.querySelectorAll('input[name="valeur"][type="number"]');
            inputs.forEach(input => {
                // S'assurer que l'input n'est pas désactivé ou en lecture seule
                input.removeAttribute('disabled');
                input.removeAttribute('readonly');
                
                input.addEventListener('input', () => {
                    console.log(`Input changé - ID: ${input.id}, Valeur: ${input.value}`);
                    calculerSimulation();
                });

                // Ajouter un écouteur pour confirmer le focus
                input.addEventListener('focus', () => {
                    console.log(`Focus sur l'input: ${input.id}`);
                });

                // Ajouter un écouteur pour les pressions de touches
                input.addEventListener('keydown', (e) => {
                    console.log(`Touche pressée dans ${input.id}: ${e.key}`);
                });
            });
        }

        document.addEventListener('DOMContentLoaded', () => {
            console.log('Page chargée, initialisation des inputs et calcul initial');
            initializeInputs();
            calculerSimulation();
        });
    </script>
</body>
</html>