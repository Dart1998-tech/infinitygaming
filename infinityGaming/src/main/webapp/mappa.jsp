<%@ page import="java.util.Map, java.util.LinkedHashMap" %>
<%
    Map<String, String> mappaImmagini = new LinkedHashMap<>(); 
    mappaImmagini.put("recommended1", "Red Decaded Redemption"); 
    mappaImmagini.put("recommended2", "Among SUS"); 
    mappaImmagini.put("recommended3", "Lara");
    mappaImmagini.put("recommended4", "Apex Respawn"); 
    mappaImmagini.put("recommended5", "Among Farts"); 
    mappaImmagini.put("recommended6", "The Legend of Elda: Losteyes");
    mappaImmagini.put("recommended7", "Eclipstichonicles: L''Ombra del Destino"); 
    mappaImmagini.put("recommended8", "Steel Horizon: La Battaglia dei Confini"); 
    mappaImmagini.put("trending1", "Street Feeder"); 
    mappaImmagini.put("trending2", "Murderers Creed"); 
    mappaImmagini.put("trending3", "Apex Respawn");
    mappaImmagini.put("trending4", "Pac-Moan"); 
    mappaImmagini.put("trending5", "The Tomb Stalker");
    mappaImmagini.put("trending6", "Cattlefield");
    mappaImmagini.put("trending7", "Need for Sheep");
    mappaImmagini.put("trending8", "Left 4 Snacks");
    mappaImmagini.put("trending9", "Final Fiasco VII");
    mappaImmagini.put("bestseller1", "Neon Horizon"); 
    mappaImmagini.put("bestseller2", "A The Utchìng");
    mappaImmagini.put("bestseller3", "The Lame Lame of");
    mappaImmagini.put("bestseller4", "FortCrash");
    mappaImmagini.put("bestseller5", "Super Malio Bros"); 
    mappaImmagini.put("bestseller6", "Don Matteo"); 
    mappaImmagini.put("bestseller7", "Grand Theft Bus"); 
    mappaImmagini.put("bestseller8", "League Of Leg-Ends"); 
    mappaImmagini.put("bestseller9", "Light Souls"); 
    mappaImmagini.put("reviewed1", "Candy Kart");
    mappaImmagini.put("reviewed2", "Cooking Mayhem"); 
    mappaImmagini.put("reviewed3", "Silent Hill"); 
    mappaImmagini.put("reviewed4", "Resident Peanuts");
    mappaImmagini.put("reviewed5", "Kingdom Come Delivery"); 
    mappaImmagini.put("reviewed6", "Duck Hunter: Apocalypse"); 
    mappaImmagini.put("reviewed7", "Lemmings One Vacation");
    mappaImmagini.put("popular1", "Alien Veggie War");
    mappaImmagini.put("popular2", "Metal Gear Salad");
    mappaImmagini.put("popular3", "Prince Rescue Simulator"); 
    mappaImmagini.put("popular4", "BioShockwave Civilis"); 
    mappaImmagini.put("popular5", "Call of Booty");
    mappaImmagini.put("popular6", "Pirate Pancake Planver"); 
    mappaImmagini.put("preorder1", "ScaffoldField"); 
    mappaImmagini.put("preorder2", "Furocalypse Sigoe");
    mappaImmagini.put("preorder3", "X"); 
    mappaImmagini.put("ps1", "The Elderly Scrolls"); 
    mappaImmagini.put("ps2", "Murderer\'s Creed");
    mappaImmagini.put("ps3", "Spider-Pork");
    mappaImmagini.put("offer1", "Clumsy Knight Chronicle"); 
    mappaImmagini.put("offer2", "Haunted Farm Tycoon");
    mappaImmagini.put("offer3", "Underwater Mafia");
%>


	<%
    Map<String, Integer> mappaID = new LinkedHashMap<>();
    mappaID.put("popular1", 30); 
    mappaID.put("popular2", 3); 
    mappaID.put("popular3", 31); 
    mappaID.put("popular4", 32); 
    mappaID.put("popular5", 33); 
    mappaID.put("popular6", 34); 
    mappaID.put("recommended1", 5);
    mappaID.put("recommended2", 41); 
    mappaID.put("recommended3", 42); 
    mappaID.put("recommended4", 43); 
    mappaID.put("recommended5", 44);
    mappaID.put("recommended6", 45); 
    mappaID.put("recommended7", 46); 
    mappaID.put("recommended8", 47); 
    mappaID.put("ps1", 11); 
    mappaID.put("ps2", 10);
    mappaID.put("ps3", 40); 
    mappaID.put("offer1", 26);
    mappaID.put("offer2", 28);
    mappaID.put("offer3", 29);
    mappaID.put("preorder1", 36);
    mappaID.put("preorder2", 35); 
    mappaID.put("preorder3", 37);
    mappaID.put("reviewed1", 48);
    mappaID.put("reviewed2", 49);
    mappaID.put("reviewed3", 50);
    mappaID.put("reviewed4", 51);
    mappaID.put("reviewed5", 52);
    mappaID.put("reviewed6", 53);
    mappaID.put("reviewed7", 54);
    mappaID.put("bestseller1", 19);
    mappaID.put("bestseller2", 21); 
    mappaID.put("bestseller3", 20); 
    mappaID.put("bestseller4", 25);
    mappaID.put("bestseller5", 6);  
    mappaID.put("bestseller6", 22); 
    mappaID.put("bestseller7", 1); 
    mappaID.put("bestseller8", 23); 
    mappaID.put("bestseller9", 24); 
    mappaID.put("trending1", 9);
    mappaID.put("trending2", 10); 
    mappaID.put("trending3", 43); 
    mappaID.put("trending4", 12);
    mappaID.put("trending5", 13);
    mappaID.put("trending6", 14);
    mappaID.put("trending7", 15); 
    mappaID.put("trending8", 16);
    mappaID.put("trending9", 18);
%>

	

<section class="game-section">
    <% 
        for (Map.Entry<String, String> entry : mappaImmagini.entrySet()) { 
    %>
        <a href="/infinityGaming/Gioco.jsp?nome=<%= entry.getValue() %>">
            <img src="images/<%= entry.getKey() %>.jpg" alt="<%= entry.getValue() %>" class="game-image">
        </a>
    <% 
        } 
    %>
</section>