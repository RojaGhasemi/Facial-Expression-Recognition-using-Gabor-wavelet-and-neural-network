%
%
% GabFilter - function for convolving image with Gabor filters
%
% Usage: EO = GaborFiltering(Im, DWScale, nOrient, minWaveLength, mult, ...
%			    sigmaOnf, dThetaOnSigma)

%   Variable        Suggested   Description
%   name            value
%    Im                        Image to be convolved.
%    DWScale                   The Desired Wavelet Scale
%    norient                   Number of filter orientations.
%    minWaveLength   = 3;      Wavelength of smallest scale filter.
%    mult            = 2;      Scaling factor between successive filters.
%    sigmaOnf        = 0.65;   Ratio of the standard deviation of the
%                              Gaussian describing the Gabor filter's transfer function
%	                           in the frequency domain to the filter center frequency.
%    dThetaOnSigma   = 1.5;    Ratio of angular interval between filter orientations
%			       and the standard deviation of the angular Gaussian
%			       function used to construct filters in the
%                              freq. plane.
%
% Returns:
%        real(EO{1,o}): is the result of convolving with the even
%        symmetric filter  for scale DWScale and orientation o.

% References :D. J. Field, "Relations Between the Statistics of Natural Images and the
%  Response Properties of Cortical Cells", Journal of The Optical Society of
%  America A, Vol 4, No. 12, December 1987. pp 2379-2394
%
function [EO] =GabFilter(im,DWScale,norient,minWaveLength,mult,sigmaOnf,dThetaOnSigma)

[rows cols] = size(im);
imagefft = fft2(im);            % Fourier transform of image
EO = cell(1, norient);          % Pre-allocate cell array

% Pre-compute some stuff to speed up filter construction
x = ones(rows,1) * (-cols/2 : (cols/2 - 1))/(cols/2);
y = (-rows/2 : (rows/2 - 1))' * ones(1,cols)/(rows/2);
radius = sqrt(x.^2 + y.^2);  % Matrix values contain * normalised* radius from centre.
radius(round(rows/2+1),round(cols/2+1)) = 1;

% Precompute sine and cosine of the polar angle of all pixels about the
% centre point
theta = atan2(-y,x); % Matrix values contain polar angle.
sintheta = sin(theta);
costheta = cos(theta);
clear x; clear y; clear theta;

thetaSigma = pi/norient/dThetaOnSigma;% Calculate the standard deviation of the
% angular Gaussian function used to construct filters in the freq. plane.

% MAIN
for o = 1:norient,
    fprintf('Processing at orientation %d \n', o);
    angl = (o-1)*pi/norient;  % Calculate filter angle.
    wavelength = minWaveLength*(mult^(DWScale-1)); % Initialize filter wavelength.

    ds = sintheta * cos(angl) - costheta * sin(angl);
    dc = costheta * cos(angl) + sintheta * sin(angl);
    dtheta = abs(atan2(ds,dc));
    spread = exp((-dtheta.^2) / (2 * thetaSigma^2)); % Calculate the angular filter component.

    % Construct the filter - first calculate the radial filter component.
    fo = 1.0/wavelength; % Centre frequency of filter.
    rfo = fo/0.5;     %  Normalised radius from centre of frequency plane
    % corresponding to fo.
    Gabor = exp((-((radius/rfo)).^2) / (2 *(sigmaOnf)^2));
    Gabor(round(rows/2+1),round(cols/2+1)) = 0;

    filter = fftshift(Gabor .* spread);

    % Return the Result
    EO{1,o} = ifft2(imagefft .* filter);
end

