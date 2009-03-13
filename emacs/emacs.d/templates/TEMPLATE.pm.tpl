package (>>>PACKAGE_NAME<<<);
use strict;
use warnings;
(>>>POINT<<<)
1;
>>>TEMPLATE-DEFINITION-SECTION<<<
("PACKAGE_NAME" (insert-string
		 (let ((filename (buffer-file-name)))
		   (if (string-match "lib/\\(.+\\)[.]pm$" filename)
		       (let ((mod (match-string 1 filename)))
			 (while (string-match "/" mod)
			   (setq mod (replace-match "::" nil nil mod)))
			 mod)
		     (if (string-match "\\([^/]+\\)[.]pm$" filename)
			 (match-string 1 filename)
		       "UNKNOWN")))
))