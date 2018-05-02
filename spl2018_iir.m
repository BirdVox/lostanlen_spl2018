%%
s = 1/40;
filter_object = fvtool([1/s, -(1-s)/s], [1]);
filter_x = filter_object.Children(15).Children.XData;
filter_tf = filter_object.Children(15).Children.YData;

%
dirac_object = fvtool([1], [1]);
dirac_x = dirac_object.Children(15).Children.XData;
dirac_tf = dirac_object.Children(15).Children.YData;

%
diff_object = fvtool([(1-s)/s, -(1-s)/s], [1]);
diff_x = diff_object.Children(15).Children.XData;
diff_tf = diff_object.Children(15).Children.YData;

%
close all
semilogx( ...
    filter_x, - filter_tf, ...
    dirac_x, - dirac_tf, ...
    diff_x, - diff_tf + 10*log10(1-s));
ylim([-20 5]);