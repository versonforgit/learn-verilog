# clear all
set nfacs [ gtkwave::getNumFacs ]
set signals [list]
for {set i 0} {$i < $nfacs } {incr i} {
    set facname [ gtkwave::getFacName $i ]
    lappend signals "$facname"
}
gtkwave::deleteSignalsFromList $signals

# add instance port
set ports [list tb_counter10.rstn tb_counter10.clk tb_counter10.cnt tb_counter10.cout]
gtkwave::addSignalsFromList $ports
