
  fig1 = ones(4,14);
  fig1 = [ 0 4 4 0 0 4 4 0 0 4 4 0 0 4;
           0 0 6 6 0 0 6 6 2 2 4 4 3 3;
           0 0 0 0 3 3 3 3 3 3 3 3 1 1; ones(1, 14)];
  
  pos1 = transl(-8, 7, 0.5);
  
  fig1 = pos1 * fig1;
      
  edge1 = [1 2; 2 3; 3 4; 4 1;
           1 5; 2 6; 3 7; 4 8;
           5 6; 10 14; 14 11; 
           11 7; 8 7; 12 8; 12 11; 
           12 13; 13 9; 9 5; 9 10; 
           13 14; 10 6];
  nvert1 = 14; nedge1 = 21;
 
 objplot(fig1, edge1, nvert1, nedge1, 'k');
 
 fig2 = ones(4, 6);
 fig2 = [ 0 4 4 0 4 0;
          0 0 2 2 1 1;
          0 0 0 0 2 2; ones(1, 6)];
  
  pos2 = transl(0, 3, 0);
  
  fig2 = pos2 * fig2;
      
  edge2 = [1 2; 2 3; 3 4; 
           4 1; 1 6; 4 6; 
           6 5; 5 2; 5 3];
  nvert2 = 6; nedge2 = 9;
 
 objplot(fig2, edge2, nvert2, nedge2, 'k');
 
 pause(1);
 
 R = trotx(pi);
 fig2 = R*fig2;
 t = transl(0, 0, -6);
 fig2 = t*fig2;
 
 objplot(fig2, edge2, nvert2, nedge2, 'g');
 
 pause(1);
 
 t = transl(-8, 6, 0);
 fig2 = t*fig2;
 
 objplot(fig2, edge2, nvert2, nedge2, 'b');
 
 pause(1);
 
 t = transl(0, 0, -6);
 fig2 = t*fig2;
 
 objplot(fig2, edge2, nvert2, nedge2, 'r');
 