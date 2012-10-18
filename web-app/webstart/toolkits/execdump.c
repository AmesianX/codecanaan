#include <windows.h>
#include <stdio.h>
#include <conio.h>

void screen();
void screen_init();
void screen_dump();

SHORT tmplineno;

HANDLE hConsoleOutput;
CONSOLE_SCREEN_BUFFER_INFO coninfo;
	
int main(int argc, char *argv[]) {
	int i;

	if (argc < 3) {
		printf("error: at least 2 argument(s)\n");
		exit(-1);
	}

	screen();

	screen_init();

	for (i = 2; i < argc; i++) {
		system(argv[i]);
	}

	screen_dump(argv[1]);

	return 0;
}

void screen() {
	hConsoleOutput = GetStdHandle(STD_OUTPUT_HANDLE);

	/* adjust screen buffer size */
	COORD size = (COORD) {80, 9999};
	SetConsoleScreenBufferSize(hConsoleOutput, size);
}

void screen_init() {
	GetConsoleScreenBufferInfo(hConsoleOutput, &coninfo);
	tmplineno = coninfo.dwCursorPosition.Y;
}

void screen_dump(char *filepath) {
	FILE *fp;
	int i, j, k;

	SHORT currlineno;
	SMALL_RECT r;
	CHAR_INFO buffer[80 * 1000];
	COORD dwBufferSize, dwBufferCoord;

	GetConsoleScreenBufferInfo(hConsoleOutput, &coninfo);
	currlineno = coninfo.dwCursorPosition.Y;
	r = (SMALL_RECT) {0, tmplineno, 80, currlineno};
	
	dwBufferSize = (COORD) {80, currlineno - tmplineno};
	dwBufferCoord = (COORD) {0, 0};
	ReadConsoleOutput (
		hConsoleOutput,
		(PCHAR_INFO) buffer,
		dwBufferSize,
		dwBufferCoord,
		&r
	);

	fp = fopen(filepath,"w");
	for (i = 0; i < (currlineno - tmplineno); i++) {
		k = -1;
		for (j = 0; j <= r.Right; j++) {
			if (buffer[i*r.Right+j+i].Char.AsciiChar != ' ') {
				k = j;
			}
		}
		if (k > -1) {
			for (j = 0; j <= k; j++) {
				fprintf(fp, "%c", buffer[i*r.Right+j+i].Char.AsciiChar);
			}
		}
		fprintf(fp, "\n");
	}
	fclose(fp);
}

