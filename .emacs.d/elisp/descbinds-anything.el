<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: descbinds-anything.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=descbinds-anything.el" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: descbinds-anything.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=descbinds-anything.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for descbinds-anything.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=descbinds-anything.el" /><meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script src="http://emacswiki.org/emacs/emacs-bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.emacswiki.org/emacs?search=%22descbinds-anything%5c.el%22">descbinds-anything.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/descbinds-anything.el">Download</a></p><pre><span class="comment">;;; descbinds-anything.el --- Yet Another `<span class="constant important">describe-bindings</span>' with `<span class="constant important">anything</span>'.</span>

<span class="comment">;; Copyright (C) 2008, 2009, 2010  Taiki SUGAWARA &lt;buzz.taiki@gmail.com&gt;</span>

<span class="comment">;; Author: Taiki SUGAWARA &lt;buzz.taiki@gmail.com&gt;</span>
<span class="comment">;; Keywords: anything, help</span>
<span class="comment">;; Version: 1.05</span>
<span class="comment">;; Time-stamp: &lt;2010-02-05 15:00:10  taiki&gt;</span>
<span class="comment">;; URL: http<span class="builtin">://www</span>.emacswiki.org/cgi-bin/wiki/descbinds-anything.el</span>
<span class="comment">;; URL: http<span class="builtin">://bitbucket</span>.org/buzztaiki/elisp/src/tip/descbinds-anything.el</span>

<span class="comment">;; This file is free software; you can redistribute it and/or modify</span>
<span class="comment">;; it under the terms of the GNU General Public License as published by</span>
<span class="comment">;; the Free Software Foundation; either version 3, or (at your option)</span>
<span class="comment">;; any later version.</span>

<span class="comment">;; This file is distributed in the hope that it will be useful,</span>
<span class="comment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="comment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="comment">;; GNU General Public License for more details.</span>

<span class="comment">;; You should have received a copy of the GNU General Public License</span>
<span class="comment">;; along with GNU Emacs; see the file COPYING.  If not, write to</span>
<span class="comment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,</span>
<span class="comment">;; Boston, MA 02110-1301, USA.</span>

<span class="comment">;;; Commentary<span class="builtin">:</span></span>
<span class="comment">;; This package is a replacement of `<span class="constant important">describe-bindings</span>'.</span>

<span class="comment">;;; Usage<span class="builtin">:</span></span>
<span class="comment">;; Add followings on your .emacs.</span>
<span class="comment">;;</span>
<span class="comment">;;   (<span class="keyword">require</span> '<span class="constant">descbinds-anything</span>)</span>
<span class="comment">;;   (descbinds-anything-install)</span>
<span class="comment">;;</span>
<span class="comment">;; Now, `<span class="constant important">describe-bindings</span>' is replaced to `<span class="constant important">descbinds-anything</span>'. Type</span>
<span class="comment">;; `C-h b', `C-x C-h' these run `<span class="constant important">descbinds-anything</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;; In the Anything buffer, you can select key-binds with anything interface.</span>
<span class="comment">;;</span>
<span class="comment">;;  - When type RET, selected candidate command is executed.</span>
<span class="comment">;;</span>
<span class="comment">;;  - When type ESC, You can <span class="string">"Execute"</span>, <span class="string">"Describe Function"</span> or <span class="string">"Find</span>
<span class="comment">;;    Function"</span> by the menu.</span>
<span class="comment">;;</span>
<span class="comment">;;  - When type C-z, selected command is described without quiting.</span>

<span class="comment">;;; History<span class="builtin">:</span></span>
<span class="comment">;; 2010-02-05   Taiki SUGAWARA  &lt;sugawara_t@ariel-networks.com&gt;</span>
<span class="comment">;; </span>
<span class="comment">;;   * descbinds-anything.el: Version 1.05</span>
<span class="comment">;;   bug fix.</span>
<span class="comment">;; </span>
<span class="comment">;; 2010-02-02 UTC  Taiki SUGAWARA  &lt;buzz.taiki@gmail.com&gt;</span>
<span class="comment">;; </span>
<span class="comment">;;   * descbinds-anything.el: Version 1.04</span>
<span class="comment">;;   add sorting feature.</span>
<span class="comment">;;   separete sorce creation function.</span>
<span class="comment">;;   add persistent action.</span>
<span class="comment">;; </span>
<span class="comment">;; 2009-03-29 UTC  Taiki SUGAWARA  &lt;buzz.taiki@gmail.com&gt;</span>
<span class="comment">;; </span>
<span class="comment">;;   * descbinds-anything.el: Version 1.03</span>
<span class="comment">;;   fix typo.</span>
<span class="comment">;; </span>
<span class="comment">;; 2008-11-16 UTC  Taiki SUGAWARA  &lt;buzz.taiki@gmail.com&gt;</span>
<span class="comment">;; </span>
<span class="comment">;;   * descbinds-anything.el: Version 1.02</span>
<span class="comment">;;   bound `indent-tabs-mode` to t for nil environment.</span>
<span class="comment">;; </span>
<span class="comment">;; 2008-11-16 UTC  Taiki SUGAWARA  &lt;buzz.taiki@gmail.com&gt;</span>
<span class="comment">;; </span>
<span class="comment">;;   * descbinds-anything.el: fix infinitive-loop when binding-line</span>
<span class="comment">;;   has not tab.</span>

<span class="comment">;;; Code<span class="builtin">:</span></span>

(<span class="keyword">require</span> '<span class="constant">anything</span>)

(<span class="keyword">defgroup</span> <span class="type">descbinds-anything</span> nil
  <span class="string">"Yet Another `<span class="constant important">describe-bindings</span>' with `<span class="constant important">anything</span>'."</span>
  <span class="builtin">:prefix</span> <span class="string">"descbinds-anything-"</span>
  <span class="builtin">:group</span> 'anything)

(<span class="keyword">defcustom</span> <span class="variable">descbinds-anything-actions</span>
  '((<span class="string">"Execute"</span> . descbinds-anything-action<span class="builtin">:execute</span>)
    (<span class="string">"Describe Function"</span> . descbinds-anything-action<span class="builtin">:describe</span>)
    (<span class="string">"Find Function"</span> . descbinds-anything-action<span class="builtin">:find-func</span>))
  <span class="string">"Actions of selected candidate."</span>
  <span class="builtin">:type</span> '(repeat
	  (cons
	   <span class="builtin">:tag</span> <span class="string">"Action"</span>
	   (string <span class="builtin">:tag</span> <span class="string">"Name"</span>)
	   (function <span class="builtin">:tag</span> <span class="string">"Function"</span>)))
  <span class="builtin">:group</span> 'descbinds-anything)

(<span class="keyword">defcustom</span> <span class="variable">descbinds-anything-candidate-formatter</span>
  'descbinds-anything-default-candidate-formatter
  <span class="string">"Candidate formatter function.
This function called two argument KEY and BINDING."</span>
  <span class="builtin">:type</span> 'function
  <span class="builtin">:group</span> 'descbinds-anything)


(<span class="keyword">defcustom</span> <span class="variable">descbinds-anything-window-style</span> 'one-window
  <span class="string">"Window splitting style."</span>
  <span class="builtin">:type</span> '(choice
	  (const <span class="builtin">:tag</span> <span class="string">"One Window"</span> one-window)
	  (const <span class="builtin">:tag</span> <span class="string">"Same Window"</span> same-window)
	  (const <span class="builtin">:tag</span> <span class="string">"Split Window"</span> split-window))
  <span class="builtin">:group</span> 'descbinds-anything)


(<span class="keyword">defcustom</span> <span class="variable">descbinds-anything-section-order</span>
  '(<span class="string">"Major Mode Bindings"</span> <span class="string">"Minor Mode Bindings"</span> <span class="string">"Global Bindings"</span>)
  <span class="string">"A list of section order by name regexp."</span>
  <span class="builtin">:type</span> '(repeat (regexp <span class="builtin">:tag</span> <span class="string">"Regexp"</span>))
  <span class="builtin">:group</span> 'descbinds-anything)

(<span class="keyword">defcustom</span> <span class="variable">descbinds-anything-source-template</span>
  '((candidate-transformer . descbinds-anything-transform-candidates)
    (persistent-action . descbinds-anything-action<span class="builtin">:describe</span>)
    (action-transformer . descbinds-anything-transform-actions))
  <span class="string">"A template of `<span class="constant important">descbinds-anything</span>' source."</span>
  <span class="builtin">:type</span> 'sexp
  <span class="builtin">:group</span> 'descbinds-anything)


(<span class="keyword">defun</span> <span class="function">descbinds-anything-all-sections</span> (buffer <span class="type">&amp;optional</span> prefix menus)
  (<span class="keyword elisp">with-temp-buffer</span>
    (<span class="keyword elisp">let</span> ((indent-tabs-mode t))
      (describe-buffer-bindings buffer prefix menus))
    (goto-char (point-min))
    (<span class="keyword elisp">let</span> ((header-p (not (= (char-after) ?\f)))
	  sections header section)
      (<span class="keyword elisp">while</span> (not (eobp))
	(<span class="keyword elisp">cond</span>
	 (header-p
	  (setq header (buffer-substring-no-properties
			(point)
			(line-end-position)))
	  (setq header-p nil)
	  (forward-line 3))
	 ((= (char-after) ?\f)
	  (push (cons header (nreverse section)) sections)
	  (setq section nil)
	  (setq header-p t))
	 ((looking-at <span class="string">"^[ \t]*$"</span>)
	  <span class="comment">;; ignore</span>
	  )
	 (t
	  (<span class="keyword elisp">let</span> ((binding-start (<span class="keyword elisp">save-excursion</span>
				 (and (re-search-forward <span class="string">"\t+"</span> nil t)
				      (match-end 0))))
		key binding)
	    (<span class="keyword cl">when</span> binding-start
	      (setq key (buffer-substring-no-properties (point) binding-start)
		    key (replace-regexp-in-string<span class="string">"^[ \t\n]+"</span> <span class="string">""</span> key)
		    key (replace-regexp-in-string<span class="string">"[ \t\n]+$"</span> <span class="string">""</span> key))
	      (goto-char binding-start)
	      (setq binding (buffer-substring-no-properties
			     binding-start
			     (line-end-position)))
	      (<span class="keyword cl">unless</span> (member binding '(<span class="string">"self-insert-command"</span>))
		(push (cons key binding) section))))))
	(forward-line))
      (push (cons header (nreverse section)) sections)
      (nreverse sections))))

(<span class="keyword">defun</span> <span class="function">descbinds-anything-action<span class="builtin">:execute</span></span> (candidate)
  <span class="string">"An action that execute selected CANDIDATE command."</span>
  (call-interactively (cdr candidate)))

(<span class="keyword">defun</span> <span class="function">descbinds-anything-action<span class="builtin">:describe</span></span> (candidate)
  <span class="string">"An action that describe selected CANDIDATE function."</span>
  (describe-function (cdr candidate)))

(<span class="keyword">defun</span> <span class="function">descbinds-anything-action<span class="builtin">:find-func</span></span> (candidate)
  <span class="string">"An action that find selected CANDIDATE function."</span>
  (find-function (cdr candidate)))

(<span class="keyword">defun</span> <span class="function">descbinds-anything-default-candidate-formatter</span> (key binding)
  <span class="string">"Default candidate formatter."</span>
  (format <span class="string">"%-10s\t%s"</span> key binding))

(<span class="keyword">defun</span> <span class="function">descbinds-anything-sort-sections</span> (sections)
  (<span class="keyword cl">flet</span> ((order (x)
		(<span class="keyword cl">loop</span> for n = 0 then (1+ n)
		      for regexp in descbinds-anything-section-order
		      if (and (car x) (string-match regexp (car x))) return n
		      finally return n)))
    (sort sections (<span class="keyword elisp">lambda</span> (a b)
		     (&lt; (order a) (order b))))))

(<span class="keyword">defun</span> <span class="function">descbinds-anything-transform-candidates</span> (candidates)
  (mapcar
   (<span class="keyword elisp">lambda</span> (pair)
     (cons (funcall descbinds-anything-candidate-formatter
		    (car pair) (cdr pair))
	   (cons (car pair) (intern-soft (cdr pair)))))
   candidates))

(<span class="keyword">defun</span> <span class="function">descbinds-anything-transform-actions</span> (actions candidate)
  (and (commandp (cdr candidate)) (or actions descbinds-anything-actions)))

(<span class="keyword">defun</span> <span class="function">descbinds-anything-sources</span> (buffer <span class="type">&amp;optional</span> prefix menus)
  (mapcar
   (<span class="keyword elisp">lambda</span> (section)
     (descbinds-anything-source (car section) (cdr section)))
   (descbinds-anything-sort-sections
    (descbinds-anything-all-sections buffer prefix menus))))

(<span class="keyword">defun</span> <span class="function">descbinds-anything-source</span> (name candidates)
  `((name . ,name)
    (candidates . ,candidates)
    ,@descbinds-anything-source-template))

(<span class="keyword">defun</span> <span class="function">descbinds-anything</span> (<span class="type">&amp;optional</span> prefix buffer)
  <span class="string">"Yet Another `<span class="constant important">describe-bindings</span>' with `<span class="constant important">anything</span>'."</span>
  (interactive)
  (<span class="keyword elisp">let</span> ((anything-sources (descbinds-anything-sources
			   (or buffer (current-buffer))
			   prefix nil))
	(anything-samewindow (and (not (minibufferp))
				  (memq descbinds-anything-window-style
					'(same-window one-window))))
	(anything-before-initialize-hook
	 (<span class="keyword elisp">if</span> (and (not (minibufferp))
		  (eq descbinds-anything-window-style 'one-window))
	     (cons 'delete-other-windows anything-before-initialize-hook)
	   anything-before-initialize-hook)))
    (anything)))

(<span class="keyword">defvar</span> <span class="variable">descbinds-anything-Orig-describe-bindings</span>
  (symbol-function 'describe-bindings))

(<span class="keyword">defun</span> <span class="function">descbinds-anything-install</span> ()
  <span class="string">"Use `<span class="constant important">descbinds-anything</span>' as a replacement of `<span class="constant important">describe-bindings</span>'."</span>
  (interactive)
  (fset 'describe-bindings 'descbinds-anything))

(<span class="keyword">defun</span> <span class="function">descbinds-anything-uninstall</span> ()
  <span class="string">"Restore original `<span class="constant important">describe-bindings</span>'."</span>
  (interactive)
  (fset 'describe-bindings descbinds-anything-Orig-describe-bindings))

(<span class="keyword">provide</span> '<span class="constant">descbinds-anything</span>)

<span class="comment">;; How to save (DO NOT REMOVE!!)</span>
<span class="comment">;; (emacswiki-post <span class="string">"descbinds-anything.el"</span>)</span>

<span class="comment">;;; descbinds-anything.el ends here</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=descbinds-anything.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local edit" accesskey="c" href="http://www.emacswiki.org/emacs/Comments_on_descbinds-anything.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=descbinds-anything.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=descbinds-anything.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=descbinds-anything.el">Administration</a></span><span class="time"><br /> Last edited 2013-08-24 11:59 UTC by <a class="author" title="from 178-83-163-103.dynamic.hispeed.ch" href="http://www.emacswiki.org/emacs/AlexSchroeder">AlexSchroeder</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=descbinds-anything.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search">
<p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
