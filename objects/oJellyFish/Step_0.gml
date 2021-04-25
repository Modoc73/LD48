
vy += 0.05;

y += vy;
if (y > maxY) {
	vy = min(0, vy-(vy*0.5) - 0.1);	
}