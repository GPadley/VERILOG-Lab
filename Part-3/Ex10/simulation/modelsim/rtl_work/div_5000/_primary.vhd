library verilog;
use verilog.vl_types.all;
entity div_5000 is
    generic(
        BIT_SZ          : integer := 16
    );
    port(
        clockout        : out    vl_logic;
        clockin         : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BIT_SZ : constant is 1;
end div_5000;
