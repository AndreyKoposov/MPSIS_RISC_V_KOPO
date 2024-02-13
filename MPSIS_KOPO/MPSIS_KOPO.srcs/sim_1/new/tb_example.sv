module tb_example();

logic a, b, c, d, e;

example DUT(
    .A(a),
    .B(b),
    .C(c),
    .D(d),
    .E(e)
);

initial begin
    #5ns;
    a = 0;
    b = 1;
    //C = 0;
    #5ns;
    c = 1;
    #5ns
    a = 0;
    b = 0;
    c = 0;
    #5ns;
    $finish();
end

endmodule