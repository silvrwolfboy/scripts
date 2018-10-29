#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void cp_license(char *);
static char *license_template(char *);
static void write_readme(char *, char *);

void cp_license(char *license)
{
	char *bsd3_path = "/usr/share/common-licenses/BSD-3-Clause";
	char *bsd2_path = "/usr/share/common-licenses/BSD-2-Clause";
	char *apache2_path = "/usr/share/common-licenses/Apache-2.0";
	char *mit_path = "/usr/share/common-licenses/MIT";
	char *gpl3_path = "/usr/share/common-licenses/GPL-3.0";
	char *alicense;

	if (strcmp(license, "bsd3") == 0)
		alicense = bsd3_path;
	else if (strcmp(license, "bsd2") == 0)
		alicense = bsd2_path;
	else if (strcmp(license, "apache2") == 0)
		alicense = apache2_path;
	else if (strcmp(license, "mit") == 0)
		alicense = mit_path;
	else if (strcmp(license, "gpl3") == 0)
		alicense = gpl3_path;

	FILE *fh1;
	fh1 = fopen(alicense, "r");

	if (fh1 == NULL) {
		fprintf(stderr, "Error: Cannot open LICENSE file for reading.\n");
		exit(1);
	}

	FILE *fh2;
	fh2 = fopen("LICENSE", "w");

	if (fh2 == NULL) {
		fprintf(stderr, "Error: Cannot copy to LICENSE file.\n");
		exit(1);
	}

	char ch;
	while ((ch = fgetc(fh1)) != EOF)
		fputc(ch, fh2);

	fclose(fh1);
	fclose(fh2);
}

char *license_template(char *choice)
{
	if ((strcmp(choice, "gpl3") == 0) || (strcmp(choice, "GPL3") == 0)) {
		cp_license("gpl3");
		return "GPL-3.0";
	}

	else if ((strcmp(choice, "apache2") == 0)
		 || (strcmp(choice, "APACHE2") == 0)) {
		cp_license("apache2");
		return "Apache-2.0";
	}

	else if ((strcmp(choice, "mit") == 0)
		 || (strcmp(choice, "MIT") == 0)) {
		cp_license("mit");
		return "MIT";
	}

	else if ((strcmp(choice, "bsd3") == 0)
		 || (strcmp(choice, "BSD3") == 0)) {
		cp_license("bsd3");
		return "BSD-3-Clause";
	}

	else if ((strcmp(choice, "bsd2") == 0)
		 || (strcmp(choice, "BSD2") == 0)
		 || (strcmp(choice, "bsd") == 0)
		 || (strcmp(choice, "BSD") == 0)) {
		cp_license("bsd2");
		return "BSD-2-Clause";
	}

	else {
		cp_license("bsd2");
		return "BSD-2-Clause";
	}
}

void write_readme(char *projn, char *license)
{
	FILE *fh;
	fh = fopen("README.md", "w");

	if (fh == NULL) {
		fprintf(stderr, "Error: cannot open README.md file\n");
		exit(1);
	}

	char *template = "%s\n"
	    "-----------\n\n"
	    "Getting Started\n"
	    "---------------\n\n"
	    "Author\n"
	    "------\n"
	    "faraco <skelic3 at gmail dot com>\n\n"
	    "License\n"
	    "-------\n"
	    "This project is licensed under the %s license. See the LICENSE file for details.\n";

	fprintf(fh, template, projn, license);
	fclose(fh);
}

int main(int argc, char **argv)
{
	if (argc != 3) {
		fprintf(stderr, "Error: need 2 arguments to run.\n");
		exit(1);
	}

	char *projn = argv[1];
	char *license = argv[2];

	write_readme(projn, license_template(license));

	return 0;
}
