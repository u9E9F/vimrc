" https://github.com/inkarkat/vim-mark

let g:mwDefaultHighlightingPalette = 'extended'
let g:mwDefaultHighlightingNum = 18


"<Leader>m               Mark the word under the cursor, similar to the star
"                        command. The next free highlight group is used.
"                        If already on a mark: Clear the mark, like
"                        <Leader>n.
" {N}<Leader>m            With {N}, mark the word under the cursor with the
"                         named highlight group {N}. When that group is not
"                        empty, the word is added as an alternative match, so
"                        you can highlight multiple words with the same color.
"                        When the word is already contained in the list of
"                        alternatives, it is removed.
"
"                        When {N} is greater than the number of defined mark
"                        groups, a summary of marks is printed. Active mark
"                        groups are prefixed with "*" (or "M*" when there are
"                        M pattern alternatives), the default next group with
"                        ">", the last used search with "/" (like :Marks
"                        does). Input the mark group, accept the default with
"                        <CR>, or abort with <Esc> or any other key.
"                        This way, when unsure about which number represents
"                        which color, just use 99<Leader>n and pick the color
"                        interactively!
"
"
"
"<Leader>n               Clear the mark under the cursor.
"                        If not on a mark: Disable all marks, similar to
"                        :nohlsearch.
"                        Note: Marks that span multiple lines are not detected,
"                        so the use of <Leader>n on such a mark will
"                        unintentionally disable all marks! Use
"                        {Visual}<Leader>r or :Mark {pattern} to clear
"                        multi-line marks (or pass [N] if you happen to know
"                        the group number).
" {N}<Leader>n            Clear the marks represented by highlight group {N}.
"
"
":Mark                   Disable all marks, similar to :nohlsearch. Marks
"                        will automatically re-enable when a mark is added or
"                        removed, or a search for marks is performed.
"
":MarkClear              Clear all marks. In contrast to disabling marks, the
"                        actual mark information is cleared, the next mark will
"                        use the first highlight group. This cannot be undone.
"
" [N]<Leader>r            Manually input a regular expression to mark.
"
" [N] - the higlight group



" [count]*         [count]#
" [count]<Leader>* [count]<Leader>#
" [count]<Leader>/ [count]<Leader>? // ****
"                         Use these six keys to jump to the [count]'th next /
"                         previous occurrence of a mark.
"                         You could also use Vim's / and ? to search, since the
"                         mark patterns are (optionally, see configuration)
"                         added to the search history, too.

