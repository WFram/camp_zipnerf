import torch
import torch.nn as nn
import sys
import gin
from typing import Any, Callable, Optional, Tuple, Union

try:
	import tinycudann as tcnn
except ImportError:
	print("This sample requires the tiny-cuda-nn extension for PyTorch.")
	print("You can install it by running:")
	print("============================================================")
	print("tiny-cuda-nn$ cd bindings/torch")
	print("tiny-cuda-nn/bindings/torch$ python setup.py install")
	print("============================================================")
	sys.exit()


@gin.configurable
class TcnnModel(nn.Module):
  config: Any = None
  sampling_strategy: Tuple[Tuple[int, int, int], Ellipsis] = (
      (0, None, 64),
      (0, None, 64),
      (1, None, 32),
  )
	mlp_params_per_level: Tuple[ml_collections.FrozenConfigDict, Ellipsis] = (
      {'disable_rgb': True},
      {'disable_rgb': False},
  )
	grid_params_per_level: Tuple[ml_collections.FrozenConfigDict, Ellipsis] = ()
	bg_intensity_range: Tuple[float, float] = (1.0, 1.0)
	anneal_slope: float = 10
	stop_level_grad: bool = True
	use_viewdirs: bool = True
	ray_shape: str = 'cone'
	single_jitter: bool = True
	near_anneal_rate: Optional[float] = None
	resample_padding: float = 0.0
	scheduled_beta: bool = False
	final_betas: Tuple[float, Ellipsis] = (1.5e-2, 3.0e-3, 1.0e-3)
	rate_beta: float = 0.75
	raydist_fn: Union[Tuple[Callable[Ellipsis, Any], Ellipsis], Callable[Ellipsis, Any]] = None
	max_exposure: float = 1.0